import 'package:Afaq/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

enum PaymentMethod { none, card, cash }

class PaymentScreenViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PaymentMethod _selectedPaymentMethod = PaymentMethod.none;

  PaymentMethod get selectedPaymentMethod => _selectedPaymentMethod;

  void toggleSelection(PaymentMethod paymentMethod) {
    if (_selectedPaymentMethod == paymentMethod) {
      // If the selected method is tapped again, deselect it (optional behavior)
      _selectedPaymentMethod = PaymentMethod.none;
    } else {
      _selectedPaymentMethod = paymentMethod;
    }
    notifyListeners(); // Notify the view to update
  }

  final _navigationService = locator<NavigationService>();

  navigateToProfileSettingView() {
    _navigationService.navigateToProfileSettingView();
  }
}
