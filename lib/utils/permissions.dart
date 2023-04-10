import 'package:permission_handler/permission_handler.dart';

handlerPermission() async {
  var permission = await Permission.sensors.status;

  if (permission.isDenied) {
    await Permission.phone.request();
    await Permission.location.request();
  }
  if (permission.isRestricted) {
    await Permission.phone.request();
    await Permission.location.request();
  }
  if (permission.isPermanentlyDenied) {
    await Permission.phone.request();
    await Permission.location.request();
  }
  if (permission.isLimited) {
    await Permission.phone.request();
    await Permission.location.request();
  }
}