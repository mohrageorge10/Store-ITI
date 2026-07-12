import 'package:store/core/helpers/api_constants.dart';

class CategoryModel 
{
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json[ApiConstants.id], name: json[ApiConstants.name]);
  }
}