import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/screens/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
