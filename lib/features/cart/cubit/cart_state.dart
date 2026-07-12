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
