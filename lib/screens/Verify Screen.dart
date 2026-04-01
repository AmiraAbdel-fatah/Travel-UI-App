import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:travello_app/CustomWidgets/custom_elevated_button.dart';
import 'package:travello_app/screens/Register.dart';
import 'package:travello_app/screens/welcom_screen.dart';
import 'package:travello_app/utils/AppColors.dart';
import 'package:travello_app/utils/AppStyles.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool _isCompleted = false;
  String _code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text("Almost there", style: AppStyles.extraBold36Black),
            SizedBox(height: 30.h),

            RichText(
              text: TextSpan(
                style: AppStyles.mixed14Black,
                children: [
                  const TextSpan(
                    text: "Please enter the 6-digit code sent to your\nemail",
                  ),
                  TextSpan(
                    text: "contact.uiuxexperts@gmail.com",
                    style: AppStyles.mixed14Black.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const TextSpan(text: "for\nverification. "),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Center(
              child: VerificationCode(
                textStyle: AppStyles.regular14Gray.copyWith(
                  color: AppColors.blackColor,
                ),
                keyboardType: TextInputType.number,
                fullBorder: true,
                fillColor: AppColors.textFieldFill,
                itemSize: 36,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                length: 6,
                cursorColor: AppColors.primary,
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                    _isCompleted = true;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _isCompleted = false;
                  });
                },
              ),
            ),
            SizedBox(height: 70.h),
            CustomElevatedButton(
              text: "Verify",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 50.h),
            Center(
              child: Column(
                children: [
                  Text(
                    "Didn’t receive any code? Resend Again",
                    style: AppStyles.semiBold20White.copyWith(
                      fontSize: 13,
                      color: AppColors.blackColor,
                    ),
                  ),

                  Text(
                    "Request a new code in 0s0:30s",
                    style: AppStyles.regular14Gray.copyWith(
                      fontSize: 13,
                      color: const Color(0xFF97979E),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 170.h),
            GestureDetector(
              onTap: () {
                {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                }
              },
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(left: 30.w),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
