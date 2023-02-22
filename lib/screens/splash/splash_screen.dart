import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_2/screens/screens.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash-screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5),
        () => Navigator.popAndPushNamed(context, HomeScreen.routeName));
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
            Container(
              height: 80,
              width: 200,
              color: Colors.black,
              alignment: Alignment.center,
              child: Text(
                "SNEAR!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
