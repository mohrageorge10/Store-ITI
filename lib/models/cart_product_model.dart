import 'package:store/core/helpers/api_constants.dart';

class CartProductModel {
  final int id;
  final String title;
  final String image;
  final num price;
  final int quantity;
  final num total;
  final num discountPercentage;
  final num discountedTotal;

  CartProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json[ApiConstants.id],
      title: json[ApiConstants.title],
      image: json[ApiConstants.thumbnail],
      price: json[ApiConstants.price],
      quantity: json[ApiConstants.quantity],
      total: json[ApiConstants.total],
      discountPercentage: json[ApiConstants.discountPercentage],
      discountedTotal: json[ApiConstants.discountedTotal],
    );
  }
}