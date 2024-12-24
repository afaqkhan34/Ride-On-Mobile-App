import 'dart:async';

import 'package:Afaq/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class OtpPageViewModel extends BaseViewModel {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode nextFocusNode) {
    if (value.length == 1) {
      nextFocusNode.requestFocus();
      notifyListeners();
    }
  }

  void completeInput(String value) {
    if (value.length == 1) {
      focusNode4.unfocus();
      // Handle verification logic
      notifyListeners();
    }
  }

  int _remainingTime = 12;
  Timer? _timer;

  String get timerText =>
      "Resend OTP (00:${_remainingTime.toString().padLeft(2, '0')})";
  bool get isTimerComplete => _remainingTime <= 0;

  void startTimer() {
    _remainingTime = 12; // Set timer to 12 seconds
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        _timer?.cancel();
      }
    });
  }

  void resendOtp() {
    if (isTimerComplete) {
      startTimer();
    }
  }

  void cleanUp() {
    _timer?.cancel();
    super.dispose();
  }

  final _navigationService = locator<NavigationService>();

  navigateToResetPasswordView() {
    _navigationService.navigateToResetPasswordView();
  }

  navigateToForgotPasswordView() {
    _navigationService.navigateToForgotPasswordView();
  }
}
