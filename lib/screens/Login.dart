import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travello_app/CustomWidgets/custom_elevated_button.dart';
import 'package:travello_app/CustomWidgets/custom_text_field.dart';
import 'package:travello_app/screens/Register.dart';
import 'package:travello_app/screens/welcom_screen.dart';
import 'package:travello_app/utils/AppColors.dart';
import 'package:travello_app/utils/AppStyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Image.asset(
                    "assets/login_logo.png", width: 320.w, height: 250.h),
                SizedBox(height: 50.h),
                const CustomTextField(
                  hintText: "Enter Your Email",
                  suffixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 16.h),
                const CustomTextField(
                  hintText: "Password",
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                Row(
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
                    Text("Remember me", style: AppStyles.regular9Black),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            const RegisterScreen()));
                      },
                      child: Text(
                        "ForgetPassword?",
                        style: AppStyles.regular9Black.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 120.h),
                CustomElevatedButton(text: "Next", onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const WelcomeScreen())
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New member ?", style: AppStyles.mixed13Black),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen())
                        );
                      },
                      child: Text(
                          "Register now", style: AppStyles.bold13Primary),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
