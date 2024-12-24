import 'package:Afaq/ui/common/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTapIcon;
  final dynamic icon; // Accepts both IconData and SVG path (String)
  final bool obscureText;
  final bool showBorder; // Toggle border visibility
  final Color borderColor; // Border color
  final Color? backgroundColor; // Optional background color

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.onTapIcon,
    this.icon,
    this.showBorder = true, // Default is true
    this.borderColor = AppColors.KcBorder, // Default border color
    this.backgroundColor, // Optional background color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w, // Fixed width
      height: 52.h, // Fixed height
      decoration: BoxDecoration(
        color: backgroundColor, // Optional background color
        borderRadius: BorderRadius.circular(16),
        border: showBorder
            ? Border.all(
                color: borderColor, // Use the provided border color
                width: 1.17.w,
              )
            : null, // No border if showBorder is false
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          bool isObscured = obscureText; // Local state for obscure text
          return TextField(
            controller: controller,
            obscureText: isObscured, // Toggle visibility dynamically
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.Regularlight.copyWith(
                  color: AppColors.KcNeutralGrey),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              suffixIcon: obscureText
                  ? IconButton(
                      icon: Icon(
                        isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey, // Icon color
                      ),
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured; // Toggle visibility
                        });
                      },
                    )
                  : (icon != null
                      ? (icon is String
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                icon,
                                width: 24.w,
                                height: 24.h,
                              ),
                            )
                          : InkWell(
                              onTap: onTapIcon,
                              child:
                                  Icon(icon as IconData, color: Colors.grey)))
                      : null), // No suffix icon if none provided
            ),
          );
        },
      ),
    );
  }
}
