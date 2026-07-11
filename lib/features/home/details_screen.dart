import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text('Details', style: AppTextStyles.kText32Black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 16,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(model.images![0], fit: BoxFit.cover),
                    ),
                    Text(model.title ?? "", style: AppTextStyles.kText24Black),
                    Row(
                      spacing: 6,
                      children: [
                        Icon(Icons.star, color: AppColors.yellow),

                        Text(
                          "4.0/5",
                          style: AppTextStyles.kText16Black.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          "(45 reviews)",
                          style: AppTextStyles.kText16Gray.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      model.description ?? "",
                      style: AppTextStyles.kText16Gray,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price", style: AppTextStyles.kText16Gray),
                      Text(
                        "\$ ${model.price} ",
                        style: AppTextStyles.kText24Black,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AppButton(
                    prefixIcon: true,
                    label: "Add to Cart",
                    onPressed: () {},
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
