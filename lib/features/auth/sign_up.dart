import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_field.dart';
import 'package:store/core/helpers/app_pass_field.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/features/auth/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 59,
          left: 16,
          right: 16,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text("Create an account", style: AppTextStyles.kText32Black),

            Text(
              "Let’s create your account.",
              style: AppTextStyles.kText16Gray,
            ),
            SizedBox(height: 24),
            Text("Full Name", style: AppTextStyles.kText16Black),
            AppField(
              controller: TextEditingController(),
              hint: "Enter your full name",
              obscureText: false,
            ),
            SizedBox(height: 16),
            Text("User Name", style: AppTextStyles.kText16Black),
            AppField(
              controller: TextEditingController(),
              hint: "Enter your email address",
              obscureText: false,
            ),
            SizedBox(height: 16),
            Text("Password", style: AppTextStyles.kText16Black),
            AppPassField(
              controller: TextEditingController(),
              hint: "Enter your password",
            ),
            SizedBox(height: 16),
            Text("Confirm Password", style: AppTextStyles.kText16Black),
            AppPassField(
              controller: TextEditingController(),
              hint: "Enter your password",
            ),
            SizedBox(height: 55),
            AppButton(label: "Create an Account", onPressed: () {}),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: AppTextStyles.kText16Gray,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text(
                    "Log In",
                    style: AppTextStyles.kText16Black.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
