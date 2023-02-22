import 'package:flutter/material.dart';
import 'package:flutter_bloc_2/screens/screens.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isCartScreen;
  CustomAppBar({Key? key, required this.title, this.isCartScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Hero(
        tag: title,
        child: Column(
          children: [
            Container(
              width:
                  isCartScreen ? MediaQuery.of(context).size.width / 1.5 : null,
              alignment: Alignment.center,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: !isCartScreen
          ? [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, WishlistScreen.routeName);
                },
                icon: const Icon(Icons.favorite),
              ),
            ]
          : [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100.0);
}
