import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/screens/login/login_controller.dart';
import 'package:save_user_cred_to_firestore/utils/color_palete.dart';
import 'package:save_user_cred_to_firestore/widgets/textfield_input.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(34),
          child: Obx(
            () => Column(
              children: [
                Flexible(child: Container(), flex: 2),
                SvgPicture.asset('assets/ic_instagram.svg',
                    color: primaryColor),
                const SizedBox(height: 20.0),
                TextFieldInput(
                  textEditingController: controller.emailController,
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20.0),
                TextFieldInput(
                  textEditingController: controller.passwordController,
                  hint: 'Password',
                  keyboardType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: controller.firebaseLogin,
                    child: controller.isLoading.value
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: primaryColor))
                        : const Center(child: Text('Sign Up'))),
                Flexible(child: Container(), flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () => Get.offAllNamed('/signup'),
                      child: const Text(
                        'Signup',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
