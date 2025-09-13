import 'package:app_store/core/networking/dio_helper.dart';
import 'package:app_store/core/networking/end_point.dart';
import 'package:app_store/screens/button_nav/home%20screen/cubit/product_cubit.dart';
import 'package:app_store/screens/button_nav/homenav.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  getcategory() async {
    try {
      emit(CategoryLoading());
      final Response response =
          await DioHelper.getRequest(endpoint: AppEndPoints.category);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final list = List<String>.from((response.data as List));
        list.insert(0, "All");
        emit(CategorySuccess(list));
      } else {
        emit(CategoryFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      emit(CategoryFailure(e.response!.data.toString()));
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }
}
