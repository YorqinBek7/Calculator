// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final VoidCallback onTap;
  const Buttons({
    super.key,
    required this.buttonColor,
    required this.text,
    required this.onTap,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 67.w,
        height: 69.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r), color: buttonColor),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 36.sp),
          ),
        ),
      ),
    );
  }
}
