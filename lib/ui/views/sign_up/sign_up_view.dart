import 'dart:typed_data';

import 'package:Afaq/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/assets.dart';
import '../../common/textstyles.dart';
import '../../custom_components/custom_button.dart';
import '../../custom_components/custom_textfield.dart';
import 'sign_up_viewmodel.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  70.verticalSpace,
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
                  47.verticalSpace,
                  Text(
                    'Sign Up',
                    style: TextStyles.largeBold,
                  ),
                  30.verticalSpace,
                  Text('Enter user name', style: TextStyles.Regularlight),
                  5.verticalSpace,
                  CustomTextField(
                    hintText: 'Rideon001',
                  ),
                  15.verticalSpace,
                  Text('Enter your email', style: TextStyles.Regularlight),
                  5.verticalSpace,
                  CustomTextField(
                    hintText: 'Rideon001@gmail.com',
                    controller: viewModel.emailController,
                  ),
                  15.verticalSpace,
                  Text('Enter your password', style: TextStyles.Regularlight),
                  5.verticalSpace,
                  CustomTextField(
                    hintText: '************',
                    controller: viewModel.passwordController,
                    obscureText: true,
                  ),
                  15.verticalSpace,
                  Text('Confirm password', style: TextStyles.Regularlight),
                  5.verticalSpace,
                  CustomTextField(
                    hintText: '************',
                    controller: viewModel.confirmPasswordController,
                    obscureText: true,
                  ),
                  20.verticalSpace,
                  CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        viewModel.navigateToLoginPageView();
                      }),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyles.Regularlight,
                      ),
                      10.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          viewModel.navigateToLoginPageView();
                        },
                        child: Text(
                          'Log In',
                          style: TextStyles.RegularBold,
                        ),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '--------------------------------------- or ----------------------------------------',
                        style: TextStyles.Regularlight.copyWith(
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      // Handle the onTap event
                    },
                    child: Container(
                      width: 327.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.KcBorder,
                          width: 1.7.w,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppSVGS.googleIcon,
                              alignment: Alignment.centerRight,
                              width: 20.w,
                              height: 20.h,
                            ),
                            5.horizontalSpace,
                            Text(
                              'Continue with Google',
                              style: TextStyles.RegularBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
