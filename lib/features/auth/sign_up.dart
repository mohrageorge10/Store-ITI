import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_field.dart';
import 'package:store/core/helpers/app_pass_field.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/core/helpers/locale_keys.dart';
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
            Text(
              LocaleKeys.createAccountTitle.tr(),
              style: AppTextStyles.kText32Black,
            ),

            Text(
              LocaleKeys.createAccountSubtitle.tr(),
              style: AppTextStyles.kText16Gray,
            ),
            const SizedBox(height: 24),

            Text(
              LocaleKeys.fullNameLabel.tr(),
              style: AppTextStyles.kText16Black,
            ),
            AppField(
              controller: TextEditingController(),
              hint: LocaleKeys.fullNameHint.tr(),
              obscureText: false,
            ),

            const SizedBox(height: 16),

            Text(
              LocaleKeys.usernameLabel.tr(),
              style: AppTextStyles.kText16Black,
            ),
            AppField(
              controller: TextEditingController(),
              hint: LocaleKeys.emailHint.tr(),
              obscureText: false,
            ),

            const SizedBox(height: 16),

            Text(
              LocaleKeys.passwordLabel.tr(),
              style: AppTextStyles.kText16Black,
            ),
            AppPassField(
              controller: TextEditingController(),
              hint: LocaleKeys.passwordHint.tr(),
            ),

            const SizedBox(height: 16),

            Text(
              LocaleKeys.confirmPasswordLabel.tr(),
              style: AppTextStyles.kText16Black,
            ),
            AppPassField(
              controller: TextEditingController(),
              hint: LocaleKeys.passwordHint.tr(),
            ),

            const SizedBox(height: 55),

            AppButton(
              label: LocaleKeys.createAccountButton.tr(),
              onPressed: () {},
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.alreadyHaveAccountText.tr(),
                  style: AppTextStyles.kText16Gray,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => const Login()));
                  },
                  child: Text(
                    LocaleKeys.logInButton.tr(),
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