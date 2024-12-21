import 'package:Afaq/main.dart';
import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:Afaq/ui/custom_components/custom_textfield.dart';
import 'package:Afaq/ui/views/start_page/start_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import '../../common/assets.dart';
import 'login_page_viewmodel.dart';

class LoginPageView extends StackedView<LoginPageViewModel> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 150,
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
                  194.verticalSpace,
                  Text(
                    'Log In',
                    style: TextStyles.largeBold,
                  ),
                  30.verticalSpace,
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
                    hintText: '***********',
                    controller: viewModel.passwordController,
                    obscureText: true,
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            viewModel.navigateToForgotPasswordView();
                          },
                          child: Text(
                            'Forgot Password!',
                            style: TextStyles.Regularlight,
                          )),
                    ],
                  ),
                  20.verticalSpace,
                  Center(
                      child: CustomButton(
                          text: 'Log In',
                          onPressed: () {
                            viewModel.navigateToDashboardView();
                          })),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyles.Regularlight,
                      ),
                      5.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          viewModel.navigateToSignUpView();
                        },
                        child: Text(
                          'Sign Up',
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
                  18.verticalSpace,
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
  LoginPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginPageViewModel();
}
