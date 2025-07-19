import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:starter/data/entities/developer_entity.dart';

import '../../../common/storage/shared_pref_storage.dart';

final developerSourceProvider = Provider<DeveloperSource>((ref) {
  return DeveloperSource(shared: ref.read(sharedPrefStorageProvider));
});

class DeveloperSource {
  final SharedPrefStorageInterface shared;
  static const String keyCode = 'devCode-hru3573h4j34j';

  DeveloperSource({required this.shared});

  Future<DeveloperEntity> get developer async {
    final read = await shared.get(keyCode);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final data = read != null
        ? DeveloperEntity.fromJson(read)
        : DeveloperEntity(mode: "production", version: packageInfo.version);
    return data.copyWith(version: packageInfo.version);
  }

  Future<void> setDev(DeveloperEntity code) async {
    await shared.store(keyCode, code.toJson());
  }

  Future<void> deleteDev() async {
    await shared.remove(keyCode);
  }

  Future<bool> get hasSession async => await shared.hasData(keyCode);
}
