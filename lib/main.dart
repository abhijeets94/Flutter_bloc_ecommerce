import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_bloc_2/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_2/config/app_router.dart';
import 'package:flutter_bloc_2/config/theme.dart';
import 'bloc_observer.dart';
import 'screens/screens.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const EcommerceBloc());
}

class EcommerceBloc extends StatelessWidget {
  const EcommerceBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
