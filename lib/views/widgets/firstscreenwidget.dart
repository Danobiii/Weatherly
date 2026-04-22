import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstScreenWidget extends StatelessWidget {
  final String text;
  const FirstScreenWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 30.sp,
      ),
    );
  }
}

class WriteUp extends StatelessWidget {
  final String text;
  const WriteUp({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
