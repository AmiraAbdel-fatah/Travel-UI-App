import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travello_app/CustomWidgets/custom_elevated_button.dart';
import 'package:travello_app/CustomWidgets/custom_text_field.dart';
import 'package:travello_app/screens/Login.dart';
import 'package:travello_app/screens/Verify%20Screen.dart';
import 'package:travello_app/utils/AppColors.dart';
import 'package:travello_app/utils/AppStyles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Image.asset(
                  "assets/register_logo.png", width: 250.w, height: 200.h),
              SizedBox(height: 20.h),
              const CustomTextField(
                hintText: "Full name",
                suffixIcon: Icons.person_outline_rounded,
              ),
              SizedBox(height: 12.h),
              const CustomTextField(
                hintText: "Valid email",
                suffixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 12.h),
              const CustomTextField(
                hintText: "Phone number",
                suffixIcon: Icons.phone_iphone,
              ),
              SizedBox(height: 12.h),
              const CustomTextField(
                hintText: "Strong password",
                suffixIcon: Icons.visibility_off_outlined,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    icon: Icon(
                      isChecked
                          ? Icons.check_box
                          : Icons.check_box_outline_blank_rounded,
                      color: isChecked ? AppColors.primary : AppColors.title,
                    ),
                  ),
                  Text("By checking the box you agree to our",
                      style: AppStyles.regular9Black),
                  Text("Terms ", style: AppStyles.regular9Black.copyWith(
                      color: AppColors.primary)),
                  Text("and ", style: AppStyles.regular9Black),
                  Text("Conditions", style: AppStyles.regular9Black.copyWith(
                      color: AppColors.primary)),
                ],
              ),
              SizedBox(height: 170.h),
              CustomElevatedButton(text: "Next", onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => VerifyScreen()));
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member?", style: AppStyles.mixed13Black),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text("Login in", style: AppStyles.bold13Primary),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
