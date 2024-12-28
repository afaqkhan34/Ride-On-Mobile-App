import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:Afaq/ui/custom_components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/assets.dart';
import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_image_view.dart';
import '../../common/ui_helpers.dart';
import 'dashboard_viewmodel.dart';
import '../../custom_components/custom_drawer.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        key: viewModel.scaffoldKey,
        drawer: CustomDrawer(),
        body: Stack(
          children: [
            // Map image as background
            Positioned.fill(
              child: CustomImageView(
                imagePath: AppImages.mapS,
                width: screenWidth(context),
                height: screenHeight(context),
              ),
            ),

            // AppBar on top of the map
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
                        // Add profile navigation logic here
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
              top: 120.h,
              left: 16.w,
              right: 16.w,
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Choose pick point',
                    icon: AppSVGS.pickupIcon,
                    backgroundColor: AppColors.Kcwhite,
                    showBorder: false,
                  ),
                  10.h.verticalSpace,
                  CustomTextField(
                    hintText: 'Choose your destination',
                    icon: AppSVGS.locationIcon,
                    backgroundColor: AppColors.Kcwhite,
                    showBorder: false,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  top: 27.h,
                  left: 13.w,
                ),
                height: 304.h,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  color: AppColors.Kcwhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 15.w,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildCarFareContainer(
                            imagePath: AppImages.blackCar,
                            titleText: 'Comfort',
                            fare: '20',
                            time: '3',
                            bgColor: AppColors.KcYellow,
                          ),
                          buildCarFareContainer(
                            imagePath: AppImages.blackCar,
                            titleText: 'Delivery',
                            fare: '20',
                            time: '3',
                            bgColor: AppColors.KcBorder,
                          ),
                          1.horizontalSpace,
                        ],
                      ),
                    ),
                    30.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: CustomButton(
                          text: 'Confirm Booking',
                          onPressed: () {
                            viewModel.navigateToTripDetailsView();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCarFareContainer({
    required String imagePath,
    required String titleText,
    required String fare,
    required String time,
    required Color bgColor,
  }) {
    return Container(
      width: 254.w,
      height: 170.h,
      child: Stack(
        children: [
          Positioned(
            top: 24.h,
            left: 0,
            child: Container(
              height: 134.h,
              width: 254.w,
              decoration: BoxDecoration(
                color: AppColors.Kcwhite,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: AppColors.KcBorder,
                    width: 1.7,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 7.w),
                    height: 56.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r)),
                    ),
                  ),
                  16.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Text(
                          titleText,
                          style: TextStyles.RegularBold,
                        ),
                        Spacer(),
                        Text(
                          'Rs $fare',
                          style: TextStyles.RegularBold,
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Row(
                      children: [
                        Text(
                          '$time min',
                          style: TextStyle(),
                        ),
                        16.horizontalSpace,
                        CustomImageView(
                          svgPath: AppSVGS.userIcon,
                          height: 16.h,
                          width: 16.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: CustomImageView(
              imagePath: imagePath,
              height: 56.h,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
