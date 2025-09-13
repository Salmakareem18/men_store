import 'dart:convert';

import 'package:app_store/core/networking/end_point.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(BaseOptions(
        baseUrl: AppEndPoints.baseUrl, receiveDataWhenStatusError: true));
    dio!.interceptors.add(PrettyDioLogger());
  }

  static postRequest(
      {required String endpoint, Map<String, dynamic>? data}) async {
    try {
      Response response = await dio!.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static getRequest({required String endpoint}) async {
    try {
      Response response = await dio!.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
