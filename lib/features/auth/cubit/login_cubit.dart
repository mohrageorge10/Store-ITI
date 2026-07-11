import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  // =================== Dio Object ===================
  final dio = Dio();

  // =================== Controllers ===================
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  // ==================== Login Method ===================
  Future<void> login() async {
    try {
      emit(LoginLoading());
      final Response response = await dio.post(
        '${ApiConstants.baseUrl}${EndPoints.login}',
        data: {
          ApiConstants.email: userEmailController.text,
          ApiConstants.password: userPasswordController.text,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        UserModel userModel = UserModel.fromJson(response.data); // هستخدمه في ال cache 
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("No token"));
      }
      
    // ==================== Error Handling ====================
    } on DioException catch (e) {
      emit(LoginFailure(e.message ?? "Error"));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
