import 'package:flutter/cupertino.dart';
import 'package:flutter_mini_project/src/service/auth_handler.dart';

import 'package:get/get.dart';

class SignUpController extends GetxController {
  final RxBool _isLoading = false.obs;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  bool get isLoading => _isLoading.value;

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;

  void register() async {
    if (_email.value.text.trim().isEmpty ||
        _password.value.text.trim().isEmpty ||
        _confirmPassword.value.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Fill in the blanks',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    if (_password.value.text.trim() != _confirmPassword.value.text.trim()) {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Password does not match.',
        textConfirm: 'Check',
        confirmTextColor: const Color.fromARGB(255, 255, 255, 255),
        onConfirm: () {
          Get.back();
        },
      );

      return;
    }

    _isLoading(true);
    AuthHandler.signUp(_email.value.text.trim(), _password.value.text.trim())
        .then(
      (value) {
        _isLoading(false);
      },
    );
  }
}
