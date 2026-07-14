import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/core/helpers/locale_keys.dart';
import 'package:store/features/cart/cubit/cart_cubit.dart';
import 'package:store/widgets/cart_items.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            LocaleKeys.myCartTitle.tr(),
            style: AppTextStyles.kText24Black,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const CartItems(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 5,
                      children: [
                        Text(
                          LocaleKeys.subtotalLabel.tr(),
                          style: AppTextStyles.kText16Gray,
                        ),
                        Text(
                          LocaleKeys.vatLabel.tr(),
                          style: AppTextStyles.kText16Gray,
                        ),
                        Text(
                          LocaleKeys.shippingFeeLabel.tr(),
                          style: AppTextStyles.kText16Gray,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          LocaleKeys.totalLabel.tr(),
                          style: AppTextStyles.kText16Black,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 5,
                      children: [
                        Text("\$ 5,870", style: AppTextStyles.kText16Black),
                        Text("\$ 0.00", style: AppTextStyles.kText16Black),
                        Text("\$ 80", style: AppTextStyles.kText16Black),
                        const SizedBox(height: 10),
                        Text("\$ 5,950", style: AppTextStyles.kText16Black),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AppButton(
                onPressed: () {},
                label: LocaleKeys.checkoutButton.tr(),
                suffixIcon: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}