import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/repositories/category/base_category_repository.dart';
import 'package:ecommerce_app/models/models.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  // Creating instance of Firestore
  CategoryRepository({FirebaseFirestore? firebaseFirestore}) :
      _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    try {
      return _firebaseFirestore
          .collection('categories')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => Category.fromSnapShot(doc))
            .toList();
      });
    } catch (e) {
      print('Error loading categories: $e');
      rethrow; // Rethrow the error to propagate it further
    }
  }


}