import 'package:store/core/helpers/api_constants.dart';

class AddressModel {
  final int id;
  final String name;
  final String description;
  final num latitude;
  final num longitude;

  AddressModel({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json[ApiConstants.id],
      name: json[ApiConstants.name],
      description: json[ApiConstants.description],
      latitude: json[ApiConstants.latitude] ,
      longitude: json[ApiConstants.longitude] ,
    );
  }
}