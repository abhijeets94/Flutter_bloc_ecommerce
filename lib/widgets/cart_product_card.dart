import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../model/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 5,
      ),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  product.price.toString(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            Row(
              children: [
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is CartLoaded) {
                      return IconButton(
                        iconSize: 28,
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(AddProductToCart(product));
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      );
                    } else {
                      return const Text("Something went wrong!");
                    }
                  },
                ),
                Text(
                  "$quantity",
                  style: Theme.of(context).textTheme.headline6,
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is CartLoaded) {
                      return IconButton(
                        iconSize: 28,
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(RemoveProductFromCart(product));
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      );
                    } else {
                      return const Text("Something Went wrong!");
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
