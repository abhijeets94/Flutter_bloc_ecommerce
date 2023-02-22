part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> props = [];
}

// class CartLoaded extends CartState {
//   final Cart cart;

//   const CartLoaded({this.cart = const Cart()});
//   @override
//   List<Object> props = [cart];
// }

class CartLoaded extends CartState {
  final Cart cart;

  const CartLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> props = [];
}
