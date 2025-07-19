import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:starter/common/errors/app_error.dart';
import 'package:starter/common/extensions/api_extension.dart';
import 'package:starter/common/typedefs/typedefs.dart';
import 'package:starter/data/datasources/session/session_source.dart';

import '../utils/api_utils.dart';

/// {@template base_repository}
/// A [BaseRepository] class for handling network status and exceptions
/// {@endtemplate}
class BaseRepository {
  BaseRepository(this._dio, this._session);

  final Dio _dio;
  final SessionSource _session;

  /// [T] is Return type f or [EitherResponse]
  ///
  /// [R] is response type from server that is params for [onSuccess] callback
  ///
  /// [onSuccess] callback returns the [T] and accept [R]
  ///
  EitherResponse<T> handleNetworkCall<R, T>({
    required Future<Response> Function(Dio dio) request,
    bool isAuth = false,
    bool isPaginate = false,
    bool isMessage = false,
    bool isResponseAll = false,
    required T Function(R data) onSuccess,
    Future<void> Function(R data)? onSaveToLocal,
    T? getOnLocal,
  }) async {
    if ((await Connectivity().checkConnectivity()).first != ConnectivityResult.none) {
      try {
        if (isAuth) {
          if (await _session.hasSession) {
            final token = await _session.token;
            _dio.options.headers.addAll({
              "Authorization": "Bearer $token",
            });
          } else {
            _dio.options.headers.remove("Authorization");
          }
        } else {
          _dio.options.headers.remove("Authorization");
        }
        final response = await request(_dio);

        if (response.statusCode == 401) {
          await _session.deleteToken();
        }
        var data = response.data;
        if (response.statusCode! >= 200 || response.statusCode! < 300) {
          data = response.data;
          final rest = isPaginate
              ? ApiUtils.parseResponsePaginate(response)
              : ApiUtils.parseResponseData(response);
          data = isMessage ? ApiUtils.parseResponseMessage(response) : rest;
        }
        if (onSaveToLocal != null) {
          await onSaveToLocal(data);
        }
        return right(onSuccess(data));
      } on DioException catch (e) {
        final error = e.toApiException;
        return left(error.when(
          serverException: (message) => AppError.serverError(message: message),
          unprocessableEntity: (message, errors) =>
              AppError.validationError(message: message, errors: errors),
          unAuthorized: (message) => AppError.unAuthorized(message: message),
          network: () => const AppError.noInternet(),
          database: (message) => AppError.serverError(message: message, code: 200),
          connectionTimeOut: () => const AppError.timeOut(),
          badCertificate: () => const AppError.badCertificate(),
          badResponse: (msg) => AppError.badResponse(message: msg),
        ));
      }
    } else {
      if (getOnLocal != null) {
        return right(getOnLocal);
      }
      return left(const AppError.noInternet());
    }
  }
}
