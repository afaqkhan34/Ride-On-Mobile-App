import 'dart:typed_data';

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
                    height: 120.h,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyles.largeBold,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('Enter user name', style: TextStyles.Regularlight),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextField(
                    hintText: 'Rideon001',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('Enter your email', style: TextStyles.Regularlight),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextField(
                    hintText: 'Rideon001@gmail.com',
                    controller: viewModel.emailController,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text('Enter your password', style: TextStyles.Regularlight),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextField(
                    hintText: '************',
                    controller: viewModel.passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text('Confirm password', style: TextStyles.Regularlight),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomTextField(
                    hintText: '************',
                    controller: viewModel.confirmPasswordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        viewModel.navigateToLoginPageView();
                      }),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyles.Regularlight,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
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
                  SizedBox(
                    height: 5.h,
                  ),
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
                  SizedBox(
                    height: 6.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle the onTap event
                    },
                    child: Container(
                      width: 327.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFE7E7E7),
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
                            SizedBox(
                              width: 5.w,
                            ),
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
