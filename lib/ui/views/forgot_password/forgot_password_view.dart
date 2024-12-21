import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/textstyles.dart';
import '../../custom_components/custom_button.dart';
import '../../custom_components/custom_textfield.dart';
import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
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
                  Container(
                    height: 39.h,
                    width: 39.w,
                    decoration: BoxDecoration(
                      color: AppColors.KcDarkYellow,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Icon(Icons.arrow_back_ios, color: AppColors.KcDarkGreyColor,),
                  ),
                  SizedBox(
                    height: 160.h,
                  ),
                  Text(
                    'Forgot Password',
                    style: TextStyles.largeBold,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                      'Don’t worry! it happens. Please enter phone number associated with your account',
                      style: TextStyles.Regularlight.copyWith(
                        color: AppColors.KcLightGreyColor,
                        fontSize: 15,
                      )),
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
                    height: 15.h,
                  ),
                  CustomButton(
                      text: 'Get OTP',
                      onPressed: () {
                        viewModel.navigateToOtpPageView();
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
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}
