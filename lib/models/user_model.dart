import 'package:store/core/helpers/api_constants.dart';

class UserModel 
{
  String? token;

  UserModel({this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json[ApiConstants.accessToken];
  }
}