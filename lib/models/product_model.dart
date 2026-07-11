import 'package:store/core/helpers/api_constants.dart';

class ProductModel {
  String? title;
  int? price;
  String? description;
  List<String>? images;

  ProductModel({
    this.title,
    this.price,
    this.description,
    this.images,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json[ApiConstants.title];
    price = json[ApiConstants.price];
    description = json[ApiConstants.description];
    images = json[ApiConstants.images].cast<String>();
  }
}
