import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission.dart';

final permissionProvider = Provider<PermissionInterface>((ref) {
  return AppPermission();
});

class AppPermission extends PermissionInterface {
  const AppPermission() : super();

  @override
  Future<void> camera() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
      if (!status.isGranted) {
        status = await Permission.camera.request();
      }
    }
  }

  @override
  Future<void> location() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
      if (!status.isGranted) {
        status = await Permission.location.request();
      }
    }
  }

  @override
  Future<void> storage() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        status = await Permission.storage.request();
      }
    }
  }

  @override
  Future<void> notification() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      status = await Permission.notification.request();
      if (!status.isGranted) {
        status = await Permission.notification.request();
      }
    }
  }
}
