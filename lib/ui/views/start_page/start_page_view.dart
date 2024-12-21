import 'package:Afaq/ui/views/start_page/start_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/assets.dart';
import '../../common/textstyles.dart';
import '../../custom_components/custom_button.dart';

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
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.rideLogo,
                width: 171.w,
                height: 46.h,
              ),
            ),
          ),
          Spacer(flex: 5),

          CustomButton(
              text: 'Log In',
              onPressed: () {
                viewModel.navigateToLoginPageView();
              }),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Create Your Account !',
              style: TextStyles.RegularBold,
            ),
          ),
          30.verticalSpace,

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 286.w,
              height: 400.h,
              child: Image.asset(
                AppImages.carImage,
                fit: BoxFit.fitHeight,
              ),
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
