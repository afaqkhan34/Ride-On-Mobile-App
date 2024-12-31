import 'package:Afaq/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class TripHistoryViewModel extends BaseViewModel {


  String _selectedValue = 'Sort by';

  String get selectedValue => _selectedValue;

  final List<String> _dropdownItems = ['Sort by','Price ', 'Option 2', 'Option 3'];

  List<String> get dropdownItems => _dropdownItems;

  void updateSelectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final _navigationService = locator<NavigationService>();

navigateToProfileSettingView() {
  _navigationService.navigateToProfileSettingView();
}}
