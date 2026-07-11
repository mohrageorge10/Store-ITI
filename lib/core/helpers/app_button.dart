import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.prefixIcon = false,
    this.suffixIcon = false,
  });
  final Function() onPressed;
  final String label;
  final bool prefixIcon;
  final bool suffixIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon
                ? Icon(Icons.shopping_bag_outlined, color: AppColors.white)
                : SizedBox(),
            Text(label, style: AppTextStyles.kText16White),
            suffixIcon
                ? Icon(Icons.arrow_forward, color: AppColors.white)
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
