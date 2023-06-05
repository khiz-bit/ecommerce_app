import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';

class ProductScreen extends StatelessWidget  {
  static const String routeName = '/product';

  // Will assign route
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar:
      BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Colors.white,),
                color: Colors.white,
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                return IconButton(
                onPressed: () {
                  context
                      .read<WishlistBloc>()
                      .add(AddProductToWishlist(product));
                  
                    final snackbar =
                    SnackBar(
                        content: Text('Added to your Wishlist!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
               },
                icon: Icon(Icons.favorite, color: Colors.white,),
              );
  },
),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white ),
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(AddProduct(product));
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Text(
                    'ADD TO CART',
                    style: Theme.of(context).textTheme.headlineMedium!,
                  )
              );
  },
)
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            //make images wider
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            //reduce space between cards
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false,
          ),
          items: [
            HeroCarouselCard(
              product: product,
        )
          ],
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width -10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,),),
                        Text('${product.price}', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,)),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
                title: Text(
                  'Product Information',
                style: Theme.of(context).textTheme.headlineMedium,
                ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sagittis id tortor at finibus. Vivamus dapibus vel mauris ac fringilla. erat vitae sagittis. Curabitur vel maximus velit, quis blandit enim. Etiam diam lacus, commodo ac tincidunt sit amet, tincidunt et orci. Sed porttitor, est ut ultricies tristique, est sapien pharetra arcu, sed porta massa felis eget urna. In sit amet finibus odio. Suspendisse id dolor mattis, ultrices risus efficitur, semper sapien.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              title: Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              children: [
                ListTile(
                  title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sagittis id tortor at finibus. Vivamus dapibus vel mauris ac fringilla. erat vitae sagittis. Curabitur vel maximus velit, quis blandit enim. Etiam diam lacus, commodo ac tincidunt sit amet, tincidunt et orci. Sed porttitor, est ut ultricies tristique, est sapien pharetra arcu, sed porta massa felis eget urna. In sit amet finibus odio. Suspendisse id dolor mattis, ultrices risus efficitur, semper sapien.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          )
              ]
      ),
    );
  }
}