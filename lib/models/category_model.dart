import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    imageUrl];

  static Category fromSnapShot(DocumentSnapshot snap) {
    Category category = Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }




}