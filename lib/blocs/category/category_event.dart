part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadCategories extends CategoryEvent{}

class UpdateCategories extends CategoryEvent{
  final List<Category> categories;

  UpdateCategories(this.categories);

  @override
  // TODO: implement props
  List<Object?> get props => [categories];

}


