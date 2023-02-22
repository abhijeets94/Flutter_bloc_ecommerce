import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

//  subtotal =  products.fold(0, (total, current) => total + current.price);

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    if (subTotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subTotal >= 30) {
      return 'You have free delivery';
    } else {
      double missing = 30.0 - subTotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE delivery';
    }
  }

  double totalFee(subtotal, deliveryFee) {
    return subtotal + deliveryFee;
  }

  @override
  List<Object> get props => [products];
}
