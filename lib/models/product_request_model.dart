import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/cart_product_model.dart';

class ProductRequestModel {
  final int id;
  final int quantity;

  ProductRequestModel({required this.id, required this.quantity});

  Map<String, dynamic> toJson() {
    return {ApiConstants.id: id, ApiConstants.quantity: quantity};
  }
}

class AddCartRequestModel {
  final int userId;
  final List<ProductRequestModel> products;

  AddCartRequestModel({required this.userId, required this.products});

  Map<String, dynamic> toJson() {
    return {
      ApiConstants.userId: userId,
      ApiConstants.products: products.map((e) => e.toJson()).toList(),
    };
  }
}

class AddCartResponse {
  final List<CartProductModel> products;

  AddCartResponse({required this.products});

  factory AddCartResponse.fromJson(Map<String, dynamic> json) {
    return AddCartResponse(
      products: (json["products"] as List)
          .map((e) => CartProductModel.fromJson(e))
          .toList(),
    );
  }
}
