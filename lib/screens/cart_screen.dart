import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget  {
  static const String routeName = '/cart';

  // Will assign route
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text(
                    'GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headlineMedium!,
                  )
              )
            ],
          ),
        ),
      ),
      body:  BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is CartLoaded){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.cart.freeDeliveryString, style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(),
                          elevation: 0,
                        ),
                        child: Text(
                            'Add More Items'
                        )
                    )
                  ],
                ),
                SizedBox(height: 10,),

                SizedBox(height: 510,
                  child: ListView.builder(
                    itemCount: state.cart
                        .productQuantity(state.cart.products)
                        .keys
                        .length,
                    itemBuilder: (context, index) {
                      return CartProductCard(
                        product: state.cart
                            .productQuantity(state.cart.products)
                        //  Keys = Product object
                            .keys
                            .elementAt(index),
                        quantity: state.cart
                            .productQuantity(state.cart.products)
                        //  Values = Quantity of product available
                            .values
                            .elementAt(index),
                      );
                    },
                  ),
                ),

              ],
            ),

            OrderSummary(),

          ],
        ),
      );

    }
    else {
      return Text("Something went wrong");
    }
  },
),
    );
  }
}



