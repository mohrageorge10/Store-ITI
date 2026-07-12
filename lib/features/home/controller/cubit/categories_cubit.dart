import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final dio = Dio();

  Future<void> getCategories() async {
    try {
      emit(CategoriesLoading());
      final Response response = await dio.get(
        '${ApiConstants.baseUrl}${EndPoints.categories}',
      );

      final List <CategoryModel> categories = (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      // --------------- Add All Categories -----------------
          categories.insert(0, CategoryModel(id: 0, name: "All"));
      emit(CategoriesSuccess(categories));
    } on DioException catch (e) {
      emit(CategoriesFailure(e.message ?? "Error found"));
    } catch (e) {
      emit(CategoriesFailure(e.toString()));
    }
  }
}
