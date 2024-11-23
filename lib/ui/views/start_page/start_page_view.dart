import 'package:Afaq/main.dart';
import 'package:Afaq/ui/common/assets.dart';
import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'start_page_viewmodel.dart';

class StartPageView extends StackedView<StartPageViewModel> {
  const StartPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          // Logo at the top but vertically centered within its space
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            // Padding to push logo down a bit
            child: Align(
              alignment: Alignment.topCenter, // Align logo to the top
              child: Image.asset(
                AppImages.rideLogo,
                width: 171.w,
                height: 46.h,
              ),
            ),
          ),
          // Spacer for pushing the buttons vertically down
          SizedBox(
            height: 200.h,
          ),
          // This will ensure the buttons are pushed towards the center

          // Buttons and "Create Account" Text centered horizontally
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Vertically center buttons
              crossAxisAlignment: CrossAxisAlignment.center,
              // Horizontally center
              children: [
                CustomButton(
                    text: 'Log In',
                    onPressed: () {
                      viewModel.navigateToLoginPageView();
                    }),
                SizedBox(height: 15.h), // Space between the buttons
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Create Your Account !',
                    style: TextStyles.RegularBold,
                  ),
                ),
              ],
            ),
          ),

          Spacer(
            flex: 1,
          ),
          // Car Image at the bottom (You can also adjust size with MediaQuery for responsiveness)
          SizedBox(
            width: 286.w,
            height: 250.h,
            child: Image.asset(
              AppImages.carImage,
              width: MediaQuery.of(context).size.width *
                  0.6.sw, // 80% of screen width
              height: MediaQuery.of(context).size.height *
                  0.4.sh, // 40% of screen height
              fit: BoxFit.contain, // Ensure the image scales properly
            ),
          ),
        ],
      ),
    );
  }

  @override
  StartPageViewModel viewModelBuilder(BuildContext context) =>
      StartPageViewModel();
}
