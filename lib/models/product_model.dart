import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Product extends Equatable{
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.isPopular,
    required this.isRecommended,
    required this.price,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        isPopular,
        isRecommended,
        price
      ];

  static Product fromSnapShot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],

    );
    return product;
  }

}
