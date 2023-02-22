import 'package:flutter/material.dart';
import '../model/models.dart';
import '../widgets/widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4.5,
      child: ListView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(products: products[index]);
          }),
    );
  }
}
