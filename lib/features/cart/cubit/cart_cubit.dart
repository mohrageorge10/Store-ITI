import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/cart_product_model.dart';
import 'package:store/models/product_model.dart';
import 'package:store/models/product_request_model.dart';

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

  // ============= Add to Cart =============
  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
  print(productId);
    try {
      emit(AddCartLoading());

      final body = AddCartRequestModel(
        userId: 1,
        products: [ProductRequestModel(id: productId, quantity: quantity)],
      );

      final response = await dio.post(
        '${ApiConstants.cartBaseUrl}${EndPoints.addToCart}',
        queryParameters: {ApiConstants.userId: 1},
        data: body.toJson(),
      );
      print(response.data);
      final result = AddCartResponse.fromJson(response.data);

      emit(AddCartSuccess(result.products));
    } on DioException catch (e) {
      emit(AddCartFailure(e.message ?? 'Error found'));
    } catch (e) {
      emit(AddCartFailure(e.toString()));
    }
  }
}
