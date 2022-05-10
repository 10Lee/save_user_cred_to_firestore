import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/responsives/responsive_layout.dart';
import 'package:save_user_cred_to_firestore/responsives/web_layout.dart';
import 'package:save_user_cred_to_firestore/screens/login/login_controller.dart';
import '../screens/login/login_screen.dart';
import '../utils/color_palete.dart';
import 'mobile_layout.dart';

class BuildResponsive extends StatelessWidget {
  const BuildResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.active) {
          if (snap.hasData) {
            return const ResponsiveLayout(
              webScreenLayout: WebLayout(),
              mobileScreenLayout: MobileLayout(),
            );
          } else if (snap.hasError) {
            return Center(
              child: Text(snap.error.toString()),
            );
          }
        } else if (snap.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }

        return LoginScreen();
      },
    );
  }
}
