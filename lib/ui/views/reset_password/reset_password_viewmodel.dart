import 'package:Afaq/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ResetPasswordViewModel extends BaseViewModel {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void signUp() {
    String newPassword = newPasswordController.text.trim();
    String confirmNewPassword = confirmNewPasswordController.text.trim();

    if (newPassword.isEmpty || confirmNewPassword.isEmpty) {
      setError('Fields cannot be empty!');
    } else if (newPassword != confirmNewPassword) {
      setError('Passwords do not match!');
    } else {
      print("Sign-up successful:  newPassword: $newPassword");
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  final _navigationService = locator<NavigationService>();

  navigateToPasswordChangedView() {
    _navigationService.navigateToPasswordChangedView();
  }
}
