import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/cart_product_model.dart';

class CartModel {
  final int id;
  final List<CartProductModel> products;
  final num total;
  final num discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json[ApiConstants.id],
      products: (json[ApiConstants.products] as List)
          .map((e) => CartProductModel.fromJson(e))
          .toList(),
      total: json[ApiConstants.total],
      discountedTotal: json[ApiConstants.discountedTotal],
      userId: json[ApiConstants.userId],
      totalProducts: json[ApiConstants.totalProducts],
      totalQuantity: json[ApiConstants.totalQuantity],
    );
  }
}