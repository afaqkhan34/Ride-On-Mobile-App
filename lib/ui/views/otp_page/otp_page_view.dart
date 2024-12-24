import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:Afaq/ui/custom_components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/textstyles.dart';
import 'otp_page_viewmodel.dart';

class OtpPageView extends StackedView<OtpPageViewModel> {
  const OtpPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpPageViewModel viewModel,
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
                    viewModel.navigateToForgotPasswordView();
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
                  'Enter OTP',
                  style: TextStyles.largeBold,
                ),
                10.verticalSpace,
                Text('An 4 digit OTP has been sent to',
                    style: TextStyles.Regularlight.copyWith(
                      color: AppColors.KcLightGreyColor,
                      fontSize: 15,
                    )),
                Text('Ride0001@gmail.com',
                    style: TextStyles.RegularBold.copyWith(fontSize: 15)),
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTextField(
                      controller: viewModel.controller1,
                      focusNode: viewModel.focusNode1,
                      onChanged: (value) =>
                          viewModel.nextField(value, viewModel.focusNode2),
                    ),
                    _buildTextField(
                      controller: viewModel.controller2,
                      focusNode: viewModel.focusNode2,
                      onChanged: (value) =>
                          viewModel.nextField(value, viewModel.focusNode3),
                    ),
                    _buildTextField(
                      controller: viewModel.controller3,
                      focusNode: viewModel.focusNode3,
                      onChanged: (value) =>
                          viewModel.nextField(value, viewModel.focusNode4),
                    ),
                    _buildTextField(
                      controller: viewModel.controller4,
                      focusNode: viewModel.focusNode4,
                      onChanged: (value) => viewModel.completeInput(value),
                    ),
                  ],
                ),
                20.verticalSpace,
                CustomButton(
                    text: 'Verify',
                    onPressed: () {
                      viewModel.navigateToResetPasswordView();
                    }),
                25.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: viewModel.isTimerComplete
                          ? viewModel.resendOtp
                          : null,
                      child: Text(
                        viewModel.timerText,
                        style: TextStyles.RegularBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required Function(String) onChanged,
  }) {
    return SizedBox(
      width: 60.w,
      height: 50.h,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyles.largeBold,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.KcNeutralGrey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.KcNeutralGrey, // Border color when focused
              width: 1,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }

  @override
  OtpPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpPageViewModel();
}
