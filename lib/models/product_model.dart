import 'package:store/core/helpers/api_constants.dart';

class ProductModel {
  final String title;
  final num price;
  final String description;
  final String categoryName;
  final List<String> images;

  ProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.categoryName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
    title: json[ApiConstants.title],
    price: json[ApiConstants.price],
    description: json[ApiConstants.description],
    images: List <String>.from(json[ApiConstants.images]),
    categoryName: json[ApiConstants.category][ApiConstants.name],
    );
  }
}
