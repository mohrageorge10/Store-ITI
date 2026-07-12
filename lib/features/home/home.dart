import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/features/home/controller/cubit/categories_cubit.dart';
import 'package:store/features/home/cubit/home_cubit.dart';
import 'package:store/widgets/products.dart';
import 'package:store/widgets/search_bar_widget.dart';
import 'package:store/widgets/store_categories.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   
    TextEditingController controller = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getAllProducts()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 59, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Discover', style: AppTextStyles.kText32Black),
              SearchBarWidget(controller: controller),
              StoreCategories(),
              SizedBox(height: 10),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is HomeFailure) {
                    return Center(child: Text(state.msg));
                  }
                  if (state is HomeSuccess) {
                    return Expanded(child: Products(state: state));
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
