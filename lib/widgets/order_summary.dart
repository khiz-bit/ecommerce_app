import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoaded){
      return Column(
        children: [
          Divider(thickness: 2,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SUBTOTAL',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text('PKR ${state.cart.subTotalString}',
                      style: Theme.of(context).textTheme.headlineSmall,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery Fee',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text('PKR ${state.cart.deliveryFeeString}',
                      style: Theme.of(context).textTheme.headlineSmall,),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(50),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(5),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Fee',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
                      Text('PKR ${state.cart.totalString}',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      );
    }
    else {return Text('Something Went wrong');}

  },
);
  }
}