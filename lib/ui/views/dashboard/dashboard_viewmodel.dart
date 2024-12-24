import 'package:Afaq/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class DashboardViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final _navigationService = locator<NavigationService>();

  navigateToTripDetailsView() {
    _navigationService.navigateToTripDetailsView();
  }
}
