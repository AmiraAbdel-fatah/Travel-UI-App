import 'package:flutter/material.dart';
import 'package:travello_app/utils/AppStyles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Register now", style: AppStyles.bold13Primary)),
    );
  }
}
