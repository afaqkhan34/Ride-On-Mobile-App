import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:Afaq/ui/custom_components/custom_drawer.dart';
import 'package:Afaq/ui/custom_components/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../custom_components/custom_app_bar.dart';
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
          Column(
            children: [
              CustomAppBar(
                  leadingIcon: Icon(Icons.menu),
                  onLeadingPressed: () {
                    viewModel.scaffoldKey.currentState?.openDrawer();
                  },
                  logo: AppImages.rideLogo,
                  profileImage: AppImages.profileLogo),
            ],
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
