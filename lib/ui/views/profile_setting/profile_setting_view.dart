import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:Afaq/ui/custom_components/custom_drawer.dart';
import 'package:Afaq/ui/custom_components/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import 'profile_setting_viewmodel.dart';

class ProfileSettingView extends StackedView<ProfileSettingViewModel> {
  const ProfileSettingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileSettingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                color: AppColors.Kcwhite,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.KcDarkGreyColor.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    width: 44.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.Kcwhite,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.KcDarkGreyColor.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]),
                    child: IconButton(
                      onPressed: () {
                        viewModel.scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu, color: Colors.black),
                    ),
                  ),
                ),
                title: Image.asset(
                  AppImages.rideLogo,
                  height: 35.h,
                  width: 132.w,
                ),
                centerTitle: true,
                actions: [
                  GestureDetector(
                    onTap: () {
                      viewModel.navigateToProfileSettingView();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profileLogo),
                        radius: 20.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 135.h,
            left: 28,
            right: 28,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Profile Settings',
                      style: TextStyles.largeMedium,
                    ),
                  ],
                ),
                35.verticalSpace,
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profileLogo),
                      radius: 20.r,
                    ),
                    15.horizontalSpace,
                    Text(
                      'Ben Stroke',
                      style: TextStyles.RegularBold,
                    ),
                    136.horizontalSpace,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                      width: 75.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: AppColors.Kcwhite,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.KcBorder,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: AppSVGS.editIcon,
                            width: 17.w,
                            height: 16.h,
                            color: AppColors.KcNeutralGrey,
                          ),
                          5.horizontalSpace,
                          Text(
                            'Edit',
                            style: TextStyles.RegularMedium.copyWith(
                              color: AppColors.KcNeutralGrey,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                35.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Email:',
                      style: TextStyles.RegularBold,
                    ),
                    10.horizontalSpace,
                    Text(
                      'Benstokes.101@gmail.com',
                      style: TextStyles.Regularlight,
                    ),
                  ],
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Phone No:',
                      style: TextStyles.RegularBold,
                    ),
                    10.horizontalSpace,
                    Text(
                      '11233674432101',
                      style: TextStyles.Regularlight,
                    ),
                  ],
                ),
                205.verticalSpace,
                CustomButton(
                  text: 'Payment Method',
                  onPressed: () {},
                  iconPath: AppSVGS.paymentIcon,
                ),
                20.verticalSpace,
                CustomButton(
                  text: 'Trip History',
                  onPressed: () {
                    viewModel.navigateToTripHistoryView();
                  },
                  iconPath: AppSVGS.tripIcon,
                ),
                20.verticalSpace,
                CustomButton(
                  text: 'Support',
                  onPressed: () {},
                  iconPath: AppSVGS.supportIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProfileSettingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileSettingViewModel();
}
