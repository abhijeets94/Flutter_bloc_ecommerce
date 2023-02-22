import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishList>(_onStartWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductToWishlist>(_onRemoveProductFromWishlist);
  }

  _onStartWishlist(StartWishList event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(
          // WishlistLoaded(
          //   wishlist: Wishlist(products: [_product]),
          // ),
          const WishlistLoaded());
    } catch (e) {
      emit(WishlistError());
    }
  }

  _onAddProductToWishlist(
      AddProductToWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from((state as WishlistLoaded).wishlist.products)
                ..add(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(WishlistError());
      }
    }
  }

  _onRemoveProductFromWishlist(
      RemoveProductToWishlist event, Emitter<WishlistState> emit) {
    if (state is WishlistLoaded) {
      try {
        if (state is WishlistLoaded) {
          emit(
            WishlistLoaded(
              wishlist: Wishlist(
                products: List.from((state as WishlistLoaded).wishlist.products)
                  ..remove(event.product),
              ),
            ),
          );
        }
      } catch (e) {
        emit(WishlistError());
      }
    }
  }
}
