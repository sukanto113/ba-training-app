import 'package:ba_training_app/shopping_cart/cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartEvent {}

class AddProductToCartEvent extends CartEvent {
  final Product product;
  AddProductToCartEvent(this.product);
}

class RemoveProductFromCartEvent extends CartEvent {
  final Product product;
  RemoveProductFromCartEvent(this.product);
}

class CartBloc extends Bloc<CartEvent, Cart> {
  CartBloc() : super(Cart()) {
    on<AddProductToCartEvent>(
      (event, emit) {
        Cart newCart = Cart();
        state.products.add(event.product);
        newCart.products = state.products;
        emit(newCart);
      },
    );
    on<RemoveProductFromCartEvent>(
      (event, emit) {
        Cart newCart = Cart();
        state.products.remove(event.product);
        newCart.products = state.products;
        emit(newCart);
      },
    );
  }
}
