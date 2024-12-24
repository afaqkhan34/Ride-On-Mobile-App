import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/assets.dart';
import 'package:Afaq/ui/custom_components/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/textstyles.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          // UserAccountsDrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //   ),
          //   accountName: Text(
          //     'Gokul Ravichandran',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   accountEmail: Row(
          //     children: [
          //       Icon(Icons.star, color: Colors.amber, size: 18),
          //       SizedBox(width: 4),
          //       Text(
          //         '4.8',
          //         style: TextStyle(color: Colors.grey),
          //       ),
          //     ],
          //   ),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundImage: AssetImage(
          //         AppImages.profileLogo), // Replace with your image path
          //   ),
          //   otherAccountsPictures: [
          //     IconButton(
          //       icon: Icon(Icons.edit, color: Colors.grey),
          //       onPressed: () {
          //         // Handle edit profile
          //         print('Edit profile tapped!');
          //       },
          //     ),
          //   ],
          // ),
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
                    // Handle navigation
                    print('Booking Page tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.business_center),
                  title: Text('Trip Details'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Trip Details tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text('Payment'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Payment tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Trip History'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Trip History tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Settings tapped!');
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
                    // Handle logout
                    print('Logout tapped!');
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
