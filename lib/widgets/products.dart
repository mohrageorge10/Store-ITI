import 'package:flutter/material.dart';
import 'package:store/features/home/cubit/home_cubit.dart';
import 'package:store/widgets/item_card.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.state});
  final HomeSuccess state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: state.model.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 19,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return ItemCard(state: state, index: index);
      },
    );
  }
}
