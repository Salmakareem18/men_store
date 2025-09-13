import 'package:app_store/core/networking/dio_helper.dart';
import 'package:app_store/core/networking/end_point.dart';
import 'package:app_store/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitial());

  getAllProduct() async {
    try {
      emit(ProductLoading());
      final Response response =
          await DioHelper.getRequest(endpoint: AppEndPoints.allProducts);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final list = List<ProductModel>.from(
            (response.data as List).map((e) => ProductModel.fromjson(e)));
        emit(ProductSuccess(list));
      } else {
        emit(Productfailure(response.data.toString()));
      }
    } on DioException catch (e) {
      emit(Productfailure(e.response!.data.toString()));
    } catch (e) {
      emit(Productfailure(e.toString()));
    }
  }

  getCategoryProduct(nameOfCategory) async {
    try {
      emit(ProductLoading());
      final Response response = await DioHelper.getRequest(
          endpoint: "${AppEndPoints.categoryProduct}$nameOfCategory");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final list = List<ProductModel>.from(
            (response.data as List).map((e) => ProductModel.fromjson(e)));
        emit(ProductSuccess(list));
      } else {
        emit(Productfailure(response.data.toString()));
      }
    } on DioException catch (e) {
      emit(Productfailure(e.response!.data.toString()));
    } catch (e) {
      emit(Productfailure(e.toString()));
    }
  }
}
