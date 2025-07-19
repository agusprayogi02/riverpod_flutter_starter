import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flavor/flavor.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

abstract class ApiService {
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        // baseUrl: 'https://cuaca-gempa-rest-api.vercel.app/',
        baseUrl: Flavor.I.getString(Keys.apiUrl) ?? 'https://jsonplaceholder.typicode.com/',
        sendTimeout: const Duration(minutes: 3),
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json; charset=UTF-8",
        },
      ),
    );
    dio.httpClientAdapter = Http2Adapter(
      ConnectionManager(idleTimeout: const Duration(seconds: 15)),
    );
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
          printErrorHeaders: true,
          printErrorData: true,
          printErrorMessage: true,
          printResponseTime: true,
        ),
      ),
    );

    return dio;
  }
}
