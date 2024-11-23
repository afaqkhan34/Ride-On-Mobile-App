import 'package:Afaq/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();

  void signUp() {
    String email = emailController.text.trim();
    @override
    void dispose() {
      emailController.dispose();

      super.dispose();
    }
  }

  final _navigationService = locator<NavigationService>();

  navigateToOtpPageView() {
    _navigationService.navigateToOtpPageView();
  }
}
