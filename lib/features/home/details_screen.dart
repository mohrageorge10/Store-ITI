import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/core/helpers/app_toast.dart';
import 'package:store/core/helpers/locale_keys.dart';
import 'package:store/features/cart/cubit/cart_cubit.dart';
import 'package:store/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            LocaleKeys.detailsTitle.tr(),
            style: AppTextStyles.kText32Black,
          ),
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
                        child: Image.network(
                          model.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(model.title, style: AppTextStyles.kText24Black),
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
                            LocaleKeys.reviewsCount.tr(),
                            style: AppTextStyles.kText16Gray.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        model.description,
                        style: AppTextStyles.kText16Gray,
                      ),
                      const SizedBox(height: 20),
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
                        Text(
                          LocaleKeys.priceLabel.tr(),
                          style: AppTextStyles.kText16Gray,
                        ),
                        Text(
                          "\$ ${model.price}",
                          style: AppTextStyles.kText24Black,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {
                        if (state is AddCartSuccess) {
                          showSnackBar(
                            message: LocaleKeys.addedSuccessfullyMsg.tr(),
                            type: AnimatedSnackBarType.success,
                            context: context,
                          );
                        }

                        if (state is AddCartFailure) {
                          showSnackBar(
                            message: state.msg,
                            type: AnimatedSnackBarType.error,
                            context: context,
                          );
                        }
                      },
                      builder: (context, state) {
                        return AppButton(
                          prefixIcon: true,
                          isLoading: state is AddCartLoading,
                          label: LocaleKeys.addToCartButton.tr(),
                          onPressed: state is AddCartLoading
                              ? null
                              : () {
                                  print("ID = ${model.id}");
                                  print("Title = ${model.title}");

                                  context.read<CartCubit>().addToCart(
                                    productId: model.id,
                                    quantity: 1,
                                  );
                                },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}