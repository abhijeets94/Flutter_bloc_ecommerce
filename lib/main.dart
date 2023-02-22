import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_2/config/app_router.dart';
import 'package:flutter_bloc_2/config/theme.dart';
import 'screens/screens.dart';

void main() {
  runApp(const EcommerceBloc());
}

class EcommerceBloc extends StatelessWidget {
  const EcommerceBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishList()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
