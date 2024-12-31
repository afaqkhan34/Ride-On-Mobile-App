import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_drawer.dart';
import 'package:Afaq/ui/custom_components/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../custom_components/custom_dotted_painter.dart';
import 'trip_history_viewmodel.dart';

class TripHistoryView extends StackedView<TripHistoryViewModel> {
  const TripHistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      TripHistoryViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Header Section
          Container(
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
              leading: Container(
                margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
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
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    viewModel.scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: Colors.black),
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
                    padding:  EdgeInsets.symmetric(horizontal: 16.w),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profileLogo),
                      radius: 20.r,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Body Section with Scrolling
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  children: [
                    35.verticalSpace,
                    Row(
                      children: [
                        Text('Trip History', style: TextStyles.largeMedium),
                        Spacer(),
                        Container(
                          width: 100.w,
                          height: 33.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: AppColors.KcBorder,
                            ),
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(8),
                              value: viewModel.dropdownItems.contains(viewModel.selectedValue)
                                  ? viewModel.selectedValue
                                  : null,
                              items: viewModel.dropdownItems.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  viewModel.updateSelectedValue(newValue);
                                }
                              },
                              underline: SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,

                    // Trip History Items
                    buildTripHistory(
                      viewModel: viewModel,
                      context: context,
                      title: 'Michael Bracewell',
                      subtitle: '4.8',
                      iconPath: AppSVGS.starIcon,
                      pickUpPoint: 'Near RUMF7314۔۔۔',
                      dropPoint: 'Home',
                      time: '7:34 AM - 7:48 AM',
                      date: '11 October',
                      imagePath: AppImages.profileLogo,
                      price: 'Rs 9,00',
                    ),
                    20.verticalSpace,
                    buildTripHistory(
                      viewModel: viewModel,
                      context: context,
                      title: 'Afaq',
                      subtitle: '5.0',
                      iconPath: AppSVGS.starIcon,
                      pickUpPoint: 'Near RUMF7314۔۔۔',
                      dropPoint: 'Office',
                      time: '1:34 AM - 3:48 AM',
                      date: '20 October',
                      imagePath: AppImages.profileLogo,
                      price: 'Rs 1000.00',
                    ),
                    20.verticalSpace,
                    buildTripHistory(
                      viewModel: viewModel,
                      context: context,
                      title: 'Ali',
                      subtitle: '5.0',
                      iconPath: AppSVGS.starIcon,
                      pickUpPoint: 'Near RUMF7314۔۔۔',
                      dropPoint: 'Office',
                      time: '12:34 AM - 1:48 AM',
                      date: '30 October',
                      imagePath: AppImages.profileLogo,
                      price: 'Rs 700.00',
                    ), 20.verticalSpace,
                    buildTripHistory(
                      viewModel: viewModel,
                      context: context,
                      title: 'Fahad',
                      subtitle: '5.0',
                      iconPath: AppSVGS.starIcon,
                      pickUpPoint: 'Near RUMF7314۔۔۔',
                      dropPoint: 'Beach',
                      time: '2:34 AM - 5:48 AM',
                      date: '27 October',
                      imagePath: AppImages.profileLogo,
                      price: 'Rs 3500.00',
                    ),
                    // Add more Trip Histories as needed
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildTripHistory({
    required TripHistoryViewModel viewModel,
    required BuildContext context,
    required String title,
    required String pickUpPoint,
    required String dropPoint,
    required String price,
    required String time,
    required String date,
    required String iconPath,
    required String subtitle,
    required String imagePath,

}) {
    return Column(
               children: [
                 Container(
                   padding:
                   EdgeInsets.symmetric(horizontal: 41, vertical: 16.h),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                     border: Border.all(
                       color: Color(0xFFEDEDED),
                       width: 1,
                     ),
                     color: AppColors.KcGreyBack,
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
                               SvgPicture.asset(
                                 AppSVGS.pickupIcon,
                                 height: 18.h,
                                 width: 18.w,
                               ),
                               1.verticalSpace,
                               Container(
                                 height: 50.h,
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
                               SvgPicture.asset(
                                 AppSVGS.locationIcon,
                                 height: 18.h,
                                 width: 15.w,
                               ),
                             ],
                           ),
                           10.horizontalSpace,
                           // Pickup and Drop-off Details
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 // Pickup Location
                                 Row(
                                   children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         // Pickup Location
                                         Text(
                                           'Pick up',
                                           style: TextStyles.RegularMedium.copyWith(
                                             fontWeight: FontWeight.w400,
                                             color: AppColors.KcLightGreyColor,
                                           ),
                                         ),

                                         // Drop-off Location
                                         Text(
                                           pickUpPoint,
                                           style: TextStyles.RegularBold.copyWith(
                                             fontWeight: FontWeight.w600,
                                           ),
                                         ),
                                       ],
                                     ),
                                     Spacer(),
                                     Text(date,style: TextStyles.RegularMedium.copyWith(
                                       fontWeight: FontWeight.w400,
                                       color: AppColors.KcLightGreyColor,
                                     ),),
                                   ],
                                 ),
                                 20.verticalSpace,
                                 Row(
                                   children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         // Pickup Location
                                         Text(
                                           'Drop off',
                                           style: TextStyles.RegularMedium.copyWith(
                                             fontWeight: FontWeight.w400,
                                             color: AppColors.KcLightGreyColor,
                                           ),
                                         ),

                                         // Drop-off Location
                                         Text(
                                           dropPoint,
                                           style: TextStyles.RegularBold.copyWith(
                                             fontWeight: FontWeight.w600,
                                           ),
                                         ),
                                       ],
                                     ),
                                     Spacer(),
                                     Text(time,style: TextStyles.RegularMedium.copyWith(
                                       fontWeight: FontWeight.w400,
                                       color: AppColors.KcLightGreyColor,
                                     ),),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 28.h),
                   width: 332.w,
                   height: 95.h,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                       border: Border.all(
                         color: AppColors.KcBorder,
                         width: 1,
                       )
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       CircleAvatar(
                         backgroundImage: AssetImage(AppImages.profileLogo),
                         radius: 20.r,
                       ),
                       8.horizontalSpace,
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(title,style: TextStyles.RegularMedium,),
                           Row(
                             crossAxisAlignment:CrossAxisAlignment.start,
                             children: [
                               Icon(
                                 Icons.star_rounded,
                                 color: AppColors.KcYellow,
                                 size: 20,
                               ),
                               Text(
                                 subtitle,
                                 style: TextStyles.Regularlight.copyWith(
                                     color: AppColors.KcNeutralGrey,
                                     fontWeight: FontWeight.w600),
                               ),


                             ],
                           ),

                         ],
                       ),
                       Spacer(),
                       Column(
                         children: [
                           Text('Price',style: TextStyles.RegularMedium,),
                           Row(
                             children: [
                               Text('Rs 9,00',style: TextStyles.RegularMedium,),
                             ],
                           ),
                         ],
                       ),

                     ],
                   ),
                 ),

               ],
             );
  }


  @override
  TripHistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TripHistoryViewModel();
}