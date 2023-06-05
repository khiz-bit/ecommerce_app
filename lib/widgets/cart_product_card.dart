import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'PKR ${product.price}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveProduct(product));
                    },
                    icon: Icon(Icons.remove_circle),
                  ),
                  Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddProduct(product));
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
