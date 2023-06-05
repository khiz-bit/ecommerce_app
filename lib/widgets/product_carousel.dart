import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ProductCard(product: products[index]));
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
        ),
      ),
    );
  }
}