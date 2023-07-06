import 'package:flutter/material.dart';
import 'package:flutter_mini_project/src/binding/sign_up_binding.dart';
import 'package:flutter_mini_project/src/service/auth_handler.dart';
import 'package:flutter_mini_project/src/view/sign_up.dart';

import 'package:get/get.dart';

class LoginViewController extends GetxController {
  final RxBool _isLoading = false.obs;

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool get isLoading => _isLoading.value;

  TextEditingController get email => _email;
  TextEditingController get password => _password;

  void validate() {
    if (_email.value.text.trim().isEmpty ||
        _password.value.text.trim().isEmpty) {
      return;
    }
    _isLoading(true);
    AuthHandler.signIn(_email.value.text.trim(), password.value.text.trim())
        .then((_) {
      _isLoading(false);
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Get.back();
      });
    });
  }

  void moveToRegister() {
    Get.to(() => const SignUpView(), binding: SignUpBinding());
  }
}
