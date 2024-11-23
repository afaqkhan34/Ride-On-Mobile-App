import 'package:Afaq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class LoginPageViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp() {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      print("Email or password cannot be empty!");
    } else {
      print("Email: $email, Password: $password");
    }
  }

  // Dispose controllers when the view is destroyed
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _navigationService = locator<NavigationService>();

  navigateToSignUpView() {
    _navigationService.navigateToSignUpView();
  }

  navigateToForgotPasswordView() {
    _navigationService.navigateToForgotPasswordView();
  }
}
