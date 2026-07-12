import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_text_styles.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.quantity});
  final int quantity;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (quantity > 1) quantity--;
            });
          },
          icon: const Icon(Icons.remove),
        ),
        Text(widget.quantity.toString(), style: AppTextStyles.kText16Black),
        IconButton(
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
