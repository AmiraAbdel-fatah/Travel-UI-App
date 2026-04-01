import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travello_app/utils/AppStyles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120.h),
            Text("Welcome to Home", style: AppStyles.extraBold24Black),
            SizedBox(height: 120.h),
            Image.asset("assets/home.png", width: 300.w, height: 155.h),
          ],
        ),
      ),
    );
  }
}
