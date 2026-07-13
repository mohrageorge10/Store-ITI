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
    this.isLoading = false,
  });
  final VoidCallback? onPressed;
  final String label;
  final bool prefixIcon;
  final bool suffixIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (prefixIcon) ...[
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                    ],

                    Text(label, style: AppTextStyles.kText16White),

                    if (suffixIcon) ...[
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
