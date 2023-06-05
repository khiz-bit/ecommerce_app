part of 'products_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
