import 'package:flutter/material.dart';
import 'package:flutter_mini_project/src/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginViewController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _title(),
            _login(),
            _button(),
            _register(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        child: Text(
          'Welcome !',
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      ),
    );
  }

  Widget _login() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: TextField(
            controller: controller.email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Email Address",
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: TextField(
            controller: controller.password,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Password",
              prefixIcon: Icon(
                Icons.lock,
              ),
            ),
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      child: Obx(
        () => TextButton(
            onPressed: controller.validate,
            child: (controller.isLoading) ? _loading() : _loginText()),
      ),
    );
  }

  Widget _register() {
    return TextButton(
        onPressed: controller.moveToRegister,
        child: const Text(
          "Register",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ));
  }

  Widget _loading() {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _loginText() {
    return const Text(
      'Login',
      style: TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
