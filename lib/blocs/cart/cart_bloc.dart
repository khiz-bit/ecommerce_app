import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/cart_model.dart';
import '../../models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded(cart: Cart()));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(AddProduct event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        final updatedCart = Cart(
          products: List.from(state.cart.products)..add(event.products),
        );
        emit(CartLoaded(cart: updatedCart));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        final updatedCart = Cart(
          products: List.from(state.cart.products)..remove(event.products),
        );
        emit(CartLoaded(cart: updatedCart));
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
