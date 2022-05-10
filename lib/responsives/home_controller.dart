import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class HomeController extends GetxController {
  var _userModel = Rxn<UserModel>();
  RxBool isLoading = false.obs;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get user => _userModel.value;

  Future getUserData() async {
    isLoading.value = true;
    DocumentSnapshot ref = await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    _userModel.value = UserModel.fromSnap(ref);
    isLoading.value = false;
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
