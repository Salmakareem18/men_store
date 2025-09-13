part of 'product_cubit.dart';

@immutable
abstract class ProductStates {}

final class ProductInitial extends ProductStates {}

final class ProductLoading extends ProductStates {}

final class ProductSuccess extends ProductStates {
  List<ProductModel> model;
  ProductSuccess(this.model);
}

final class Productfailure extends ProductStates {
  final String errmsg;

  Productfailure(this.errmsg);
}
