part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class StartWishList extends WishlistEvent {
  @override
  List<Object?> get props => [];
}

class AddProductToWishlist extends WishlistEvent {
  final Product product;

  const AddProductToWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductToWishlist extends WishlistEvent {
  final Product product;

  const RemoveProductToWishlist(this.product);

  @override
  List<Object> get props => [product];
}
