import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/responsives/home_controller.dart';
import 'package:save_user_cred_to_firestore/utils/color_palete.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : Text('${controller.user.email}'),
        ),
      ),
    );
  }
}
