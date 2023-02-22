import 'package:flutter/material.dart';
import 'package:flutter_bloc_2/screens/product/product_screen.dart';
import '../model/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.products,
    this.widthFactor,
    this.isWishList = false,
  }) : super(key: key);

  final Product products;
  final double? widthFactor;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: products);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 4.5,
              width: widthFactor == null
                  ? MediaQuery.of(context).size.height / 4.5
                  : MediaQuery.of(context).size.height / widthFactor!,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(products.imageUrl)),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 8.0,
            child: Container(
              color: const Color.fromARGB(33, 0, 0, 0),
              width: widthFactor == null
                  ? MediaQuery.of(context).size.height / 4.5
                  : MediaQuery.of(context).size.height / (widthFactor! + 0.1),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    products.name,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: const Color.fromARGB(199, 255, 255, 255)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          debugPrint("add");
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      isWishList
                          ? IconButton(
                              onPressed: () {
                                debugPrint("delete");
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
