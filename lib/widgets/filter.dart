
import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_colors.dart';

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.tune_rounded,
        color: AppColors.white,
        size: 24,
      ),
    );
  }
}
