import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/features/home/cubit/home_cubit.dart';
import 'package:store/features/home/details_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.index, required this.state});
  final int index;
  final HomeSuccess state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(model: state.model[index]),
          ),
        );
      },
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(
                state.model[index].images[0],
                fit: BoxFit.cover,
              ),
            ),
            Text(
              state.model[index].title ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.kText16Black,
            ),
            Text(
              "\$ ${state.model[index].price} ",
              style: AppTextStyles.kText12Gray,
            ),
          ],
        ),
      ),
    );
  }
}
