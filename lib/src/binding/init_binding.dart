import 'package:flutter_mini_project/src/controller/login_controller.dart';
import 'package:flutter_mini_project/src/service/auth_handler.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthHandler());
    Get.put(LoginViewController());
  }
}
