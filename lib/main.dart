import 'package:flutter/material.dart';
import 'package:Afaq/app/app.bottomsheets.dart';
import 'package:Afaq/app/app.dialogs.dart';
import 'package:Afaq/app/app.locator.dart';
import 'package:Afaq/app/app.router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    ScreenUtilInit(
      designSize: Size(384, 833),
      builder: (context, child) {
        return const MainApp(); // The widget that will be returned in the builder
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
