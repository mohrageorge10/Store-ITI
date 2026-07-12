import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_text_styles.dart';
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
          title: const Text("My Cart", style: AppTextStyles.kText24Black),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CartItems(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 5,
                      children: [
                        Text("Sub-total", style: AppTextStyles.kText16Gray),
                        Text("VAT (%)", style: AppTextStyles.kText16Gray),
                        Text("Shipping fee", style: AppTextStyles.kText16Gray),
                        SizedBox(height: 10),
                        Text("Total", style: AppTextStyles.kText16Black),
                      ],
                    ),
                    Column(
                      spacing: 5,
                      children: [
                        Text("\$ 5,870", style: AppTextStyles.kText16Black),
                        Text("\$ 0.00", style: AppTextStyles.kText16Black),
                        Text("\$ 80", style: AppTextStyles.kText16Black),
                        SizedBox(height: 10),
                        Text("\$ 5,950", style: AppTextStyles.kText16Black),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              AppButton(
                onPressed: () {},
                label: "Go To Checkout",
                suffixIcon: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
