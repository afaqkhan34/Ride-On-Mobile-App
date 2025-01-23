import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../login_page/login_page_view.dart';

class StartPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToLoginPageView() {
    _navigationService.navigateToLoginPageView();
  }
  navigateToSignUpView() {
    _navigationService.navigateToSignUpView();
  }
}
