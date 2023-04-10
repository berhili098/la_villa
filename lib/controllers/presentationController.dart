import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PresentationController extends GetxController {
  RxBool firstTime = false.obs;
  checkFirstTime() async {
    final isFirstTime = await GetStorage().read('isFirstTime');
    if (isFirstTime == false) {
      firstTime.value = false;
      update();
    } else {
      firstTime.value = true;
      update();
    }
  }

  changeFirstTime() async {
    await GetStorage().write('isFirstTime', false);
  }

  @override
  void onInit() async {
    await checkFirstTime();
    super.onInit();
  }
}
