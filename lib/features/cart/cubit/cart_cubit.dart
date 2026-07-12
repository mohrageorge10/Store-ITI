import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/cart_product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final dio = Dio();

  Future<void> getCartData() async {
    try {
      emit(CartLoading());
      final Response response = await dio.get(
        '${ApiConstants.cartBaseUrl}${EndPoints.cart}',
      );

      final List<CartProductModel> cart =
          (response.data[ApiConstants.carts][0][ApiConstants.products] as List)
              .map((e) => CartProductModel.fromJson(e))
              .toList();

      emit(CartSuccess(cart));
    } on DioException catch (e) {
      emit(CartFailure(e.message ?? "Error found"));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
