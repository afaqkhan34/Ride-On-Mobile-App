import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
}
