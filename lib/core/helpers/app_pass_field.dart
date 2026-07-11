import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_field.dart';

class AppPassField extends StatefulWidget {
  const AppPassField({super.key, required this.controller, required this.hint});
  final TextEditingController controller;
  final String hint;

  @override
  State<AppPassField> createState() => _AppPassFieldState();
}

class _AppPassFieldState extends State<AppPassField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return AppField(
      controller: widget.controller,
      hint: widget.hint,
      obscureText: obscure,
      suffixIcon: IconButton(
        icon: Icon(
          obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: AppColors.grey,
        ),
        onPressed: () {
          setState(() {
            obscure = !obscure;
          });
        },
      ),
    );
  }
}
