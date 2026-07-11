import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final dio = Dio();

  Future<void> getProducts() async {
    try {
      emit(HomeLoading());
      final Response response = await dio.get(
        '${ApiConstants.baseUrl}${EndPoints.products}',
      );

      final products = response.data as List;
      final data = products
          .map((product) => ProductModel.fromJson(product))
          .toList();

      emit(HomeSuccess(data));
    } on DioException catch (e) {
      emit(HomeFailure(e.message ?? "Error found"));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
