import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/responsives/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
