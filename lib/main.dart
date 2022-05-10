import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_user_cred_to_firestore/responsives/home_binding.dart';
import 'package:save_user_cred_to_firestore/responsives/stream_builder.dart';
import 'package:save_user_cred_to_firestore/screens/login/login_binding.dart';
import 'package:save_user_cred_to_firestore/screens/login/login_screen.dart';
import 'package:save_user_cred_to_firestore/screens/signup/signup_binding.dart';
import 'package:save_user_cred_to_firestore/screens/signup/signup_screen.dart';
import 'package:save_user_cred_to_firestore/utils/color_palete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBTPr69QpnvivWF1rKoUNyJP5tEHzSF5dY",
          authDomain: "save-user-cred-to-firestore.firebaseapp.com",
          projectId: "save-user-cred-to-firestore",
          storageBucket: "save-user-cred-to-firestore.appspot.com",
          messagingSenderId: "19986558334",
          appId: "1:19986558334:web:ef9f0a19ce858414f8d72f"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackground,
      ),
      getPages: [
        GetPage(
          name: '/buildresponsive',
          page: () => const BuildResponsive(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignupScreen(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
          binding: LoginBinding(),
        ),
      ],
      initialRoute: '/buildresponsive',
    );
  }
}
