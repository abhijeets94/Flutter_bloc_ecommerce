import 'package:flutter/material.dart';

import '../model/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({Key? key, required this.product}) : super(key: key);

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
                IconButton(
                  iconSize: 28,
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline),
                ),
                Text(
                  "1",
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  iconSize: 28,
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle_outline),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
