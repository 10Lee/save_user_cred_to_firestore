import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_user_cred_to_firestore/models/user_model.dart';

class SignupController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  Rx<Uint8List>? imageGallery = Rx(Uint8List(0));
  final ImagePicker _imagePicker = ImagePicker();

  RxBool isLoading = false.obs;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    bioController.dispose();
    super.dispose();
  }

  Future<String> firebaseSignUp() async {
    isLoading.value = true;
    String res = 'Entering Try Catch';
    try {
      if (usernameController.text.isNotEmpty ||
          emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty ||
          bioController.text.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        String photo = await uploadImageToFirestore();

        UserModel userCred = UserModel(
          username: usernameController.text,
          photo: photo,
          uid: cred.user!.uid,
          bio: bioController.text,
          email: emailController.text,
          followers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(userCred.toJson());
        res = 'success';
        isLoading.value = false;
      }
    } catch (e) {
      res = e.toString();
      Get.snackbar('Error', e.toString());
    }
    return res;
  }

  void pickImage() async {
    XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_file == null) {
      print('IMAGEPICKER IS EMPTY');
    } else {
      imageGallery!.value = await _file.readAsBytes();
    }
  }

  // This method will be called inside firebaseSignup() to fill photo data
  Future<String> uploadImageToFirestore() async {
    Reference ref = await _storage
        .ref()
        .child('profileImage')
        .child(_auth.currentUser!.uid);

    TaskSnapshot taskSnapshot = await ref.putData(imageGallery!.value);
    return await taskSnapshot.ref.getDownloadURL();
  }
}
