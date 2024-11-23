import 'package:Afaq/ui/common/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured =
        widget.obscureText; // Initialize based on `obscureText` property
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 327.w, // Fixed width
        height: 40.h, // Fixed height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE7E7E7),
            width: 1.17.w,
          ),
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: _isObscured, // Dynamically control visibility
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyles.Regularlight,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey, // Icon color
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured; // Toggle visibility
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
