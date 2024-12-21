import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger callback when tapped
      child: Container(
        width: 327.w, // Fixed width
        height: 52.h, // Fixed height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // Border radius
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.KcLightYellow, // First gradient color
              AppColors.KcDarkYellow, // Second gradient color
            ],
            stops: [0.5642, 1.1682], // Gradient stops based on your input
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.KcDarkGreyColor.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.RegularBold,
          ),
        ),
      ),
    );
  }
}
