import 'package:Afaq/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:Afaq/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:Afaq/ui/views/home/home_view.dart';
import 'package:Afaq/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:Afaq/ui/views/start_page/start_page_view.dart';
import 'package:Afaq/ui/views/login_page/login_page_view.dart';
import 'package:Afaq/ui/views/sign_up/sign_up_view.dart';
import 'package:Afaq/ui/views/forgot_password/forgot_password_view.dart';
import 'package:Afaq/ui/views/otp_page/otp_page_view.dart';
import 'package:Afaq/ui/views/reset_password/reset_password_view.dart';
import 'package:Afaq/ui/views/password_changed/password_changed_view.dart';

import '../ui/views/dashboard/dashboard_view.dart';
import 'package:Afaq/ui/views/trip_details/trip_details_view.dart';
import 'package:Afaq/ui/views/payment_screen/payment_screen_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: StartPageView),
    MaterialRoute(page: LoginPageView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: OtpPageView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: PasswordChangedView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: TripDetailsView),
    MaterialRoute(page: PaymentScreenView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
