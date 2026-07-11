import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';

class StoreCategories extends StatefulWidget {
  const StoreCategories({super.key, required this.categories});
  final List<String> categories;

  @override
  State<StoreCategories> createState() => _StoreCategoriesState();
}

class _StoreCategoriesState extends State<StoreCategories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: index == selectedIndex
                      ? Border.all(color: AppColors.primary)
                      : Border.all(color: AppColors.grey),
                  color: index == selectedIndex
                      ? AppColors.primary
                      : AppColors.white,
                ),
                child: Text(
                  widget.categories[index],
                  style: index == selectedIndex
                      ? AppTextStyles.kText16White
                      : AppTextStyles.kText16Black,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemCount: widget.categories.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
