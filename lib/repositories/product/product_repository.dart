import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/models.dart';

import 'package:ecommerce_app/repositories/product/base_product_repository.dart';


class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    try {
      return _firebaseFirestore
          .collection('products')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => Product.fromSnapShot(doc))
            .toList();
      });
    } catch (e) {
      print('Error loading products: $e');
      rethrow;
    }
  }
}