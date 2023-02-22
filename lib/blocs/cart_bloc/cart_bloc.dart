import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartStarted);
    on<AddProductToCart>(_onCartAdded);
    on<RemoveProductFromCart>(_onCartRemoved);
  }

  _onCartStarted(CartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (a) {
      emit(CartError());
    }
  }

  _onCartAdded(AddProductToCart event, Emitter<CartState> emit) async {
    try {
      if (state is CartLoaded) {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from((state as CartLoaded).cart.products)
                ..add(event.product),
            ),
          ),
        );
      }
    } catch (e) {
      emit(CartError());
    }
  }

  _onCartRemoved(RemoveProductFromCart event, Emitter<CartState> emit) {
    try {
      emit(
        CartLoaded(
          cart: Cart(
            products: List.from((state as CartLoaded).cart.products)
              ..remove(event.product),
          ),
        ),
      );
    } catch (e) {
      emit(CartError());
    }
  }
}
