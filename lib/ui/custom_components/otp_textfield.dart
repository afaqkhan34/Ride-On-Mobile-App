import 'package:flutter/material.dart';

class OTPTextField extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  final Function(int index, String value) onChanged;
  final String hintText;

  const OTPTextField({
    required this.controller,
    required this.index,
    required this.onChanged,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 59,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center, // Centers text horizontally
        keyboardType: TextInputType.number,
        maxLength: 1, // Restrict to one digit
        onChanged: (value) =>
            onChanged(index, value), // Notify ViewModel of change
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16, // Customize hint text size
            color: Colors.grey,
          ),
          counterText: '',
          contentPadding: EdgeInsets.zero, // Ensures vertical centering
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
