import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final Icon leadingIcon;
  final VoidCallback onLeadingPressed;
  final dynamic logo; // Accepts String (image path) or Widget
  final dynamic profileImage; // Accepts String (image path) or Widget

  CustomAppBar({
    required this.leadingIcon,
    required this.onLeadingPressed,
    required this.logo,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.only(
          left: 16.0.w, right: 16.0.w, bottom: 0.0.h, top: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32.0.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Leading Icon
          GestureDetector(
            onTap: onLeadingPressed,
            child: Container(
              width: 44.0.w,
              height: 32.0.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(child: leadingIcon),
            ),
          ),

          // Center Logo
          logo is String
              ? Image.asset(
            logo,
            width: 120.w,
            height: 35.h,
          )
              : logo as Widget,

          // Profile Image
          profileImage is String
              ? CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: 20.r,
          )
              : profileImage as Widget,
        ],
      ),
    );
  }
}
