import 'package:app_store/core/helpers/cash_helper.dart';
import 'package:app_store/core/networking/dio_helper.dart';
import 'package:app_store/core/networking/end_point.dart';
import 'package:app_store/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool obscureText = true;
  void toggleEye() {
    obscureText = !obscureText;
    emit(LoginInitial());
  }

  void login() async {
    try {
      emit(LoginLoading());
      final Response response = await DioHelper.postRequest(
          endpoint: AppEndPoints.login,
          data: {
            "username": namecontroller.text,
            "password": passwordcontroller.text
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        UserModel userModel = UserModel.fromjason(response.data);
        if (userModel.token != null) {
          await CashHelper.saveToken(userModel.token!);
        } else {
          emit(LoginFailure("No Token Found"));
        }

        emit(LoginSuccess(response.data.toString()));
      } else {
        emit(LoginFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      emit(LoginFailure(e.response!.data.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
