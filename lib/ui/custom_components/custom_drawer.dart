import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/assets.dart';
import 'package:Afaq/ui/custom_components/custom_image_view.dart';
import 'package:Afaq/ui/views/dashboard/dashboard_view.dart';
import 'package:Afaq/ui/views/login_page/login_page_view.dart';
import 'package:Afaq/ui/views/payment_screen/payment_screen_view.dart';
import 'package:Afaq/ui/views/profile_setting/profile_setting_view.dart';
import 'package:Afaq/ui/views/trip_details/trip_details_view.dart';
import 'package:Afaq/ui/views/trip_history/trip_history_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../common/textstyles.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Container(
            margin: EdgeInsets.only(left: 16.w),
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.Kcwhite,
            ),
            child: Icon(Icons.arrow_back),
          ),

          25.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                CustomImageView(
                  width: 72.w,
                  height: 72.w,
                  radius: BorderRadius.circular(50),
                  imagePath: AppImages.profileLogo,
                ),
                16.horizontalSpace,
                Column(
                  children: [
                    Text(
                      'Gokul Ravichandran',
                      style: TextStyles.RegularBold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 18,
                        ),
                        4.verticalSpace,
                        Text(
                          '4.8',
                          style: TextStyles.RegularBold.copyWith(
                              color: AppColors.KcNeutralGrey),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.edit,
                )
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.car_rental),
                  title: Text('Booking Page'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardView()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.business_center),
                  title: Text('Trip Details'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TripDetailsView()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text('Payment'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentScreenView()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Trip History'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TripHistoryView()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileSettingView()),
                    );
                  },
                ),
              ],
            ),
          ),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.power_settings_new, color: Colors.red),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPageView()),
                    );
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
