part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<CartProductModel> products;
  CartSuccess(this.products);
}

final class CartFailure extends CartState {
  final String msg;
  CartFailure(this.msg);
}


// ============= Add to Cart =============
final class AddCartLoading extends CartState {}

final class AddCartSuccess extends CartState {
  final List<CartProductModel> products;
  AddCartSuccess(this.products);
}

final class AddCartFailure extends CartState {
  final String msg;
  AddCartFailure(this.msg);
}
