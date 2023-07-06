import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mini_project/src/binding/home_binding.dart';
import 'package:flutter_mini_project/src/binding/login_binding.dart';
import 'package:flutter_mini_project/src/constants/firebase_const.dart';
import 'package:flutter_mini_project/src/view/home.dart';
import 'package:flutter_mini_project/src/view/login.dart';
import 'package:get/get.dart';

class AuthHandler extends GetxService {
  final _user = auth.currentUser.obs;

  @override
  void onReady() {
    super.onReady();
    _user.bindStream(auth.authStateChanges());
    ever(_user, moveToPage);
  }

  moveToPage(User? user) {
    if (user == null) {
      Get.off(() => const LoginView(), binding: LoginViewBinding());
    } else {
      Get.off(() => const HomeView(), binding: HomeBinding());
    }
  }

  static Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // ignore: avoid_print
      print('?óê?ü¨');
    }
  }

  static Future<void> signUp(String email, String password) async {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print('?óê?ü¨');
    }
  }
}
