import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<String> firebaseLogin() async {
    isLoading.value = true;
    String res = 'Entering try catch';

    try {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        res = 'success';
        isLoading.value = false;
      }
    } catch (e) {
      res = e.toString();
      Get.snackbar('Error', e.toString());
    }
    return res;
  }
}
