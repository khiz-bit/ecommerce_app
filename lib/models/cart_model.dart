import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const < Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();

    //We check whether product is already added to the map or not
    products.forEach((product) {
      if(!quantity.containsKey(product)) {
        quantity[product] = 1;
      }
      else (quantity[product] += 1);
    });
    return quantity;
  }

  String freeDelivery(subTotal){
    if(subTotal >= 100){
      return 'You have Free Delivery!';
    } else {
      double missing = 100.0 - subTotal;

      return 'Add ${missing.toStringAsFixed(2)} for FREE Delivery!';
    }
  }

  double total(subTotal, deliveryFee){
    return subTotal + deliveryFee(subTotal);
  }

  double deliveryFee(subTotal){
    if(subTotal >= 100){
      return 0.0;
    } else return 100;
  }

  String get totalString => total(subTotal,deliveryFee).toStringAsFixed(2);
  String get subTotalString => subTotal.toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subTotal);
  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);
  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);




}