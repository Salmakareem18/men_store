part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  List<String> model;
  CategorySuccess(this.model);
}

class CategoryFailure extends CategoryState {
  final String? errmsg;
  CategoryFailure(this.errmsg);
}
