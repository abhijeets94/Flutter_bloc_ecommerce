import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  // Cart();

  double subtotal = products.fold(0, (total, current) => total + current.price);

  double get subTotal => subtotal;

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

  static List<Product> products = [
    const Product(
      name: "Soft Drink #1",
      category: 'Soft Drink',
      imageUrl:
          "https://images.unsplash.com/photo-1543253687-c931c8e01820?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: "Soft Drink #2",
      category: 'Soft Drink',
      imageUrl:
          "https://images.unsplash.com/photo-1533007716222-4b465613a984?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: "Soft Drink #3",
      category: 'Soft Drink',
      imageUrl:
          "https://images.unsplash.com/photo-1567103472667-6898f3a79cf2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: "Soft Drink #1",
      category: 'Soft Drink',
      imageUrl:
          "https://images.unsplash.com/photo-1543253687-c931c8e01820?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: "Smoothies #1",
      category: 'Smoothies',
      imageUrl:
          "https://images.unsplash.com/photo-1494315153767-9c231f2dfe79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: "Smoothies #2",
      category: 'Smoothies',
      imageUrl:
          "https://images.unsplash.com/photo-1638176311291-36b0eacc6b08?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];

  @override
  List<Object> get props => [];
}
