import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/assets.dart';
import 'password_changed_viewmodel.dart';

class PasswordChangedView extends StackedView<PasswordChangedViewModel> {
  const PasswordChangedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PasswordChangedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 142,
              right: 0,
              child: Image.asset(
                AppImages.backgroundImage,
                width: 90.w,
                height: 160.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.rideLogo,
                        width: 171.w,
                        height: 46.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Center(
                    child: Image.asset(
                      AppImages.passwordReset,
                      width: 208.w,
                      height: 208.h,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                      child: Text(
                    'Password Reset Successfully!',
                    style: TextStyles.mediumBold,
                  )),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Text(
                      'Your password is changed now.',
                      style: TextStyles.RegularMedium.copyWith(
                        fontSize: 12,
                        color: AppColors.KcMediumGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                      text: 'Back To Login',
                      onPressed: () {
                        viewModel.navigateToLoginPageView();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  PasswordChangedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PasswordChangedViewModel();
}
