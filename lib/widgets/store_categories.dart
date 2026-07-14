import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/features/home/controller/cubit/categories_cubit.dart';
import 'package:store/features/home/cubit/home_cubit.dart';

class StoreCategories extends StatefulWidget {
  const StoreCategories({super.key});

  @override
  State<StoreCategories> createState() => _StoreCategoriesState();
}

class _StoreCategoriesState extends State<StoreCategories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return SizedBox(height: 10);
          }
          if (state is CategoriesFailure) {
            return Center(child: Text(state.msg));
          }
          if (state is CategoriesSuccess) {
            return SizedBox(
              height: 40,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      if (state.categories[index].id == 0) {
                        context.read<HomeCubit>().getAllProducts();
                      } else {
                        context.read<HomeCubit>().filterProducts(
                          categoryId: state.categories[index].id,
                        );
                      }
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
                        state.categories[index].name,
                        style: index == selectedIndex
                            ? AppTextStyles.kText16White
                            : AppTextStyles.kText16Black,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.categories.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
