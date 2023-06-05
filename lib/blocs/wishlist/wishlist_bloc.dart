import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishlist>(_onAddProductWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductWishlist);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (_) {
      emit(WishlistLoadError());
    }
  }
  void _onAddProductWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded){
      try{
        emit (WishlistLoaded
          (wishlist: Wishlist(
          products: List.from(state.wishlist.products)..add(event.product),
        )
        ),);
      } on Exception {
        emit( WishlistLoadError());
      }
    }
  }
  void _onRemoveProductWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded){
      try{
        emit (WishlistLoaded
          (wishlist: Wishlist(
          products: List.from(state.wishlist.products)..remove(event.product),
        )
        ),);
      } on Exception {
        emit( WishlistLoadError());
      }
    }
  }


}
