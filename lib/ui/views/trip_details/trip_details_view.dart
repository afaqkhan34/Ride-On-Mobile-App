import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/ui_helpers.dart';
import '../../custom_components/custom_drawer.dart';
import '../../custom_components/custom_image_view.dart';
import 'trip_details_viewmodel.dart';

class TripDetailsView extends StackedView<TripDetailsViewModel> {
  const TripDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TripDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(
        alignment: Alignment.center,
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
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: 27.h,
                // left: 13.w,
              ),
              height: 580.h,
              width: screenWidth(context),
              decoration: BoxDecoration(
                color: AppColors.Kcwhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      spacing: 15.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Trip Details',
                          style: TextStyles.largeMedium,
                        )
                      ]),
                  40.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: AppImages.person,
                          width: 52.w,
                          height: 52.h,
                          radius: BorderRadius.all(Radius.circular(500)),
                        ),
                        13.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dennis Oliver',
                                style: TextStyles.RegularBold.copyWith(
                                  fontWeight: FontWeight.w700,
                                )),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.KcYellow,
                                  size: 20,
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyles.Regularlight.copyWith(
                                      color: AppColors.KcNeutralGrey,
                                      fontWeight: FontWeight.w600),
                                ),

                              ],
                            )
                          ],
                        ),
                        63.horizontalSpace,
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            width: 52.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: AppColors.Kcwhite,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(1, 1),
                                ),],
                            ),
                            child: CustomImageView(
                              svgPath: AppSVGS.chatIcon,

                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            width: 52.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              gradient:RadialGradient(
                                colors: [
                                  // Yellow
                                  AppColors.KcYellow,
                                  Color(0xFFFFE879),
                                  AppColors.Kcwhite,// Transparent yellow
                                ],
                                radius: 2.5,
                                center: Alignment.topLeft,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: CustomImageView(
                              svgPath: AppSVGS.callIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text('Car Detail:',style: TextStyles.mediumLight,textAlign: TextAlign.start,),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text('Honda Accord 2023 • White',style: TextStyles.Regularlight.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.KcLightGreyColor,
                    ),),
                  ),
                  74.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text('Trip Detail',style: TextStyles.mediumLight,),
                  ),
                  10.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 41, vertical: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFEDEDED),
                        width: 1,
                      ),
                      color: AppColors.KcNeutralGrey.withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        // Trip Detail Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pickup Location Icon and Text
                            Column(
                              children: [
                                SvgPicture.asset(AppSVGS.pickupIcon, height: 18.h,width: 18.w,),
                                1.verticalSpace,
                                Container(
                                  height: 31.h,
                                  width: 1.w,
                                  // decoration: BoxDecoration(
                                  //   border: Border(
                                  //     left: BorderSide(
                                  //       color: AppColors.KcNeutralGrey,
                                  //       width: 1,
                                  //       style: BorderStyle.values,
                                  //     ),
                                  //   ),
                                  // ),

                                  child: CustomPaint(
                                    painter: DottedBorderPainter(
                                      color: AppColors.KcNeutralGrey,
                                      width: 1.0,
                                      dashWidth: 4.0,
                                      dashSpacing: 2.0,
                                    ),
                                  ),
                                ),
                                // Icon(Icons.location_on_outlined, color: AppColors.KcYellow, size: 18),
                                SvgPicture.asset(AppSVGS.locationIcon,height: 18.h,width: 15.w,),
                              ],
                            ),
                            10.horizontalSpace,
                            // Pickup and Drop-off Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Pickup Location
                                  Text(
                                    'Skate Park',
                                    style: TextStyles.RegularBold.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  33.verticalSpace,
                                  // Drop-off Location
                                  Text(
                                    'Home',
                                    style: TextStyles.RegularBold.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
30.verticalSpace,

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(
      height : 52.h,
        width: 150.w,
        child: CustomButton(text: 'Cancel Trip', onPressed: (){})),
    10.horizontalSpace,
    SizedBox(
      height: 52.h,
        width: 150.w,
        child: CustomButton(text: 'Modify Trip', onPressed: (){})),
  ],
),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }

  @override
  TripDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TripDetailsViewModel();
}


class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double width;
  final double dashWidth;
  final double dashSpacing;

  DottedBorderPainter({
    required this.color,
    this.width = 1.0,
    this.dashWidth = 4.0,
    this.dashSpacing = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    double startY = 0.0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
