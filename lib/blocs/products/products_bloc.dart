import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../repositories/product/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(
            UpdateProducts(products),
          ),
    );
  }

  void _onUpdateProducts(UpdateProducts event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }

  @override
  Future<void> close() {
    _productSubscription?.cancel();
    return super.close();
  }
}
