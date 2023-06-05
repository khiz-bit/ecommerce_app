part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable{
  const CategoryState();
}

class CategoryLoading extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({this.categories = const <Category>[]});

  @override
  List<Object> get props => [categories];
}

