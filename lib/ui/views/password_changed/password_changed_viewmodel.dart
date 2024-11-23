import 'package:Afaq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class PasswordChangedViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToLoginPageView() {
    _navigationService.navigateToLoginPageView();
  }
}
