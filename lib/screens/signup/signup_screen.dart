import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/screens/signup/signup_controller.dart';
import 'package:save_user_cred_to_firestore/utils/color_palete.dart';
import 'package:save_user_cred_to_firestore/widgets/textfield_input.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.find<SignupController>();

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
                Stack(
                  children: [
                    controller.imageGallery!.value.isNotEmpty
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                MemoryImage(controller.imageGallery!.value),
                          )
                        : const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage(
                              'assets/no_profile.png',
                            ),
                          ),
                    Positioned(
                      bottom: -10.0,
                      right: -10.0,
                      child: IconButton(
                          onPressed: controller.pickImage,
                          icon: Icon(Icons.add_a_photo, color: primaryColor)),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                TextFieldInput(
                  textEditingController: controller.usernameController,
                  hint: 'Username',
                  keyboardType: TextInputType.text,
                ),
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
                TextFieldInput(
                  textEditingController: controller.bioController,
                  hint: 'Bio',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () async {
                      String res = await controller.firebaseSignUp();
                      print(res);
                    },
                    child: controller.isLoading.value
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: primaryColor))
                        : const Center(child: Text('Sign Up'))),
                Flexible(child: Container(), flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                      onTap: () => Get.offAllNamed('/login'),
                      child: const Text(
                        'Login',
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
