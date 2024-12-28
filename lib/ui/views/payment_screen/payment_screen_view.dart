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
import '../trip_details/trip_details_view.dart';
import 'payment_screen_viewmodel.dart';

class PaymentScreenView extends StackedView<PaymentScreenViewModel> {
  const PaymentScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      PaymentScreenViewModel viewModel,
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
              ),
              height: 601.h,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Payment',
                        style: TextStyles.largeMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      74.verticalSpace,
                      Text(
                        'Total Fare :',
                        style: TextStyles.largeMedium,
                      ),
                      87.horizontalSpace,
                      Text(
                        'Rs.250',
                        style: TextStyles.largeMedium,
                      ),
                    ],
                  ),
                  75.verticalSpace,
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 29.w),
                    child: Row(
                      children: [
                        Text(
                          'Choose Payment Method',
                          style: TextStyles.mediumLight.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  buildPaymentCard(
                    viewModel: viewModel,
                    context: context,
                    iconPath: AppSVGS.cardIcon,
                    title: 'Card',
                    subtitle: 'Balance : Rs 250.00',
                    paymentMethod: PaymentMethod.card,  // Pass the card payment method
                  ),
                  buildPaymentCard(
                    viewModel: viewModel,
                    context: context,
                    iconPath: AppSVGS.cashIcon,
                    title: 'Cash',
                    subtitle: 'Prepare your cash',
                    paymentMethod: PaymentMethod.cash,  // Pass the cash payment method
                  ),
                  42.verticalSpace,
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 29.w),
                    child: CustomButton(text: 'Pay', onPressed: (){}),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentCard({
    required PaymentScreenViewModel viewModel,
    required BuildContext context,
    required String title,
    required String iconPath,
    required String subtitle,
    required PaymentMethod paymentMethod,
  }) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleSelection(paymentMethod);  // Toggle selection for the payment method
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
        height: 105.h,
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: AppColors.KcGreyBack,
          border: Border.all(
            color: AppColors.KcBorder,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CustomImageView(svgPath: iconPath, height: 40.h, width: 40.w),
            28.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.RegularMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                3.verticalSpace,
                Text(
                  subtitle,
                  style: TextStyles.Regularlight.copyWith(
                    color: AppColors.KcDarkMed,
                  ),
                ),
              ],
            ),
            108.horizontalSpace,
            SvgPicture.asset(
              AppSVGS.pickupIcon,
              height: 28.h,
              width: 28.w,
              color: viewModel.selectedPaymentMethod == paymentMethod
                  ? null
                  : AppColors.KcBorder,  // Highlight the selected payment method
            ),
          ],
        ),
      ),
    );
  }

  @override
  PaymentScreenViewModel viewModelBuilder(BuildContext context) => PaymentScreenViewModel();
}
