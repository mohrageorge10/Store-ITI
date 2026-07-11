import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';

class AppField extends StatelessWidget {
  const AppField({
    super.key,
    required this.controller,
    this.validator,
    required this.hint,
    this.suffixIcon,
    this.obscureText = false,
    this.isSearch = false,
  });
  final TextEditingController controller;
  final String Function(String?)? validator;
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.kText16Gray,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        prefixIcon: isSearch
            ? const Icon(Icons.search, color: AppColors.grey)
            : null,
      ),
    );
  }
}
