import 'package:flutter/material.dart';
import '../../model/models.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = "/cart";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
        isCartScreen: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text("GO TO CHECKOUT",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Cart().freeDelivery(Cart().deliveryFee(Cart().subTotal)),
                  style: Theme.of(context).textTheme.headline5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {},
                  child: Text(
                    "Add More Items",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
              itemCount: Cart.products.length,
              itemBuilder: (context, index) {
                return CartProductCard(product: Cart.products[index]);
              },
            ),
          ),
          Spacer(),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 3,
            color: Colors.grey[300],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 4,
                vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SUBTOTAL",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "\$ ${Cart().subTotal.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 4,
                vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DELIVERY FEE",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "\$ ${Cart().deliveryFee(Cart().subTotal)}",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 7,
                vertical: 10),
            child: Container(
              alignment: Alignment.center,
              // width: MediaQuery.of(context).size.width - 30,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 3.5,
                ),
                color: Colors.black,
                // borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "\$ ${Cart().totalFee(Cart().subTotal, Cart().deliveryFee(Cart().subTotal))}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
