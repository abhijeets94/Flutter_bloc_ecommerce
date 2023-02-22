import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import '../../model/models.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = "/catalog-screen";

  static Route route({required CategoryModel category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final CategoryModel category;
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct = Product.products
        .where((proudct) => proudct.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: categoryProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(products: categoryProduct[index]);
            }),
      ),
    );
  }
}
