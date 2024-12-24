import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/textstyles.dart';
import '../../custom_components/custom_textfield.dart';
import 'reset_password_viewmodel.dart';

class ResetPasswordView extends StackedView<ResetPasswordViewModel> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ResetPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
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
                24.verticalSpace,
                GestureDetector(
                  onTap: () {
                    viewModel.navigateToOtpPageView();
                  },
                  child: Container(
                    height: 39.h,
                    width: 39.w,
                    decoration: BoxDecoration(
                      color: AppColors.KcDarkYellow,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.KcDarkGreyColor,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                179.verticalSpace,
                Text(
                  'Reset Password',
                  style: TextStyles.largeBold,
                ),
                24.verticalSpace,
                Text('New password', style: TextStyles.Regularlight),
                5.verticalSpace,
                CustomTextField(
                  hintText: '******',
                  obscureText: true,
                ),
                15.verticalSpace,
                Text('Confirm new password', style: TextStyles.Regularlight),
                5.verticalSpace,
                CustomTextField(
                  hintText: '******',
                  obscureText: true,
                ),
                20.verticalSpace,
                CustomButton(
                    text: 'Reset Password',
                    onPressed: () {
                      viewModel.navigateToPasswordChangedView();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ResetPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResetPasswordViewModel();
}
