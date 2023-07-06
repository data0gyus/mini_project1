import 'package:flutter_mini_project/src/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginViewController());
  }
}
