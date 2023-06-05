import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  // Will assign route
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ecommerce'),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      //make images wider
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      //reduce space between cards
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                    ),
                    items: state.categories
                        .map((category) =>
                        HeroCarouselCard(category: category)).toList(),
                  );
                } else {
                  return Text('Something went wrong');
                }
              },
            ),
          ),
          SectionTitle(title: 'Recommended'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products.where((product) =>
                  product.isRecommended)
                      .toList(),
                );
              } else {
                return Text('Something went wrong.');
              }
            },
          ),
          SectionTitle(title: 'MOST POPULAR'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products.where((product) =>
                  product.isPopular)
                      .toList(),
                );
              } else {
                return Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}
