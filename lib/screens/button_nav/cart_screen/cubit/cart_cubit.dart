import 'package:app_store/core/networking/dio_helper.dart';
import 'package:app_store/core/networking/end_point.dart';
import 'package:app_store/models/cart_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  getUserCart(id) async {
    try {
      emit(CartLoading());
      final Response response = await DioHelper.getRequest(
          endpoint: "${AppEndPoints.cartProduct}$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final list = List<cartModel>.from(
            (response.data as List).map((e) => cartModel.fromJson(e)));
        emit(CartSuccess(list));
      } else {
        emit(CartFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      emit(CartFailure(e.toString()));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
