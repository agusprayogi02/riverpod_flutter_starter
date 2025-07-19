import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:starter/common/storage/shared_pref_storage.dart';
import 'package:starter/data/datasources/locals/developer_source.dart';
import 'package:starter/data/entities/developer_entity.dart';
import 'package:starter/data/models/session_model.dart';

final sessionSourceProvider = Provider<SessionSource>((ref) {
  return SessionSource(shared: ref.read(sharedPrefStorageProvider));
});

class SessionSource {
  final SharedPrefStorageInterface shared;
  static const String _key = '8042459706dd79e7d0e8855a299f3785580951ef';

  SessionSource({required this.shared});

  Future<SessionModel?> get session async {
    final read = await shared.get(_key);
    if (read == null) return null;
    return SessionModel.fromJson(read);
  }

  Future<void> setSession(SessionModel session) async {
    await shared.store(_key, session.toJson());
  }

  Future<void> deleteSession() async {
    await shared.remove(_key);
  }

  Future<DeveloperEntity> get developer async {
    final read = await shared.get(DeveloperSource.keyCode);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final data = read != null
        ? DeveloperEntity.fromJson(read)
        : DeveloperEntity(mode: '', version: packageInfo.version);
    return data.copyWith(version: packageInfo.version);
  }

  Future<void> deleteAll() async => await shared.reset();

  Future<bool> get hasSession async => await shared.hasData(_key);
}
