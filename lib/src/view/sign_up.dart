import 'package:flutter/material.dart';

import 'package:flutter_mini_project/src/components/gredient_button.dart';
import 'package:flutter_mini_project/src/controller/sign_up_controller.dart';
import 'package:flutter_mini_project/src/res/image_path.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _image(),
                _title(),
                _input(),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Image.asset(
          ImagePath.SignInViewImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Register',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _input() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: TextField(
            controller: controller.email,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              prefixIcon: Icon(Icons.email),
            ),
            obscureText: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: TextField(
            controller: controller.password,
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: TextField(
            controller: controller.confirmPassword,
            decoration: const InputDecoration(
              hintText: 'Password Check',
              prefixIcon: Icon(Icons.lock),
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
      padding: const EdgeInsets.all(24.0),
      child: Obx(
        () => GradientButton(
            onPressed: controller.register,
            width: double.infinity,
            height: 20,
            child: (controller.isLoading) ? _loading() : _resisterText()),
      ),
    );
  }

  Widget _resisterText() {
    return const Text(
      'Register',
      style: TextStyle(fontFamily: 'Ubuntu', fontSize: 24, color: Colors.white),
    );
  }

  Widget _loading() {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}
