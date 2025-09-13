part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  List<cartModel> model;
  CartSuccess(this.model);
}

class CartFailure extends CartState {
  final String? errmsg;
  CartFailure(this.errmsg);
}
