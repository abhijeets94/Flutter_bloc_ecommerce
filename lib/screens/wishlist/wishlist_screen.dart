import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../widgets/widgets.dart';
import '../../model/models.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const String routeName = "/wishlist-screen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Wishlist",
        ),
        bottomNavigationBar: const CustomNavBar(),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WishlistLoaded) {
              return Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: state.wishlist.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        products: state.wishlist.products[index],
                        widthFactor: 2.1,
                        isWishList: true,
                      );
                    }),
              );
            } else {
              return const Center(
                child: Text("Something went wrong!"),
              );
            }
          },
        ));
  }
}
