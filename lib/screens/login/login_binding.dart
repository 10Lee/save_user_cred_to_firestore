import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/screens/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
