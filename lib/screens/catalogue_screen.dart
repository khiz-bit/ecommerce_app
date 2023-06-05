import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/repositories/product/product_repository.dart';

class CatalogueScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  // Will assign route
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogueScreen(category: category),
    );
  }

  final Category category;

  const CatalogueScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Scaffold(
            appBar: CustomAppBar(title: category.name),
            bottomNavigationBar: CustomNavBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is ProductLoaded) {
          final categoryProducts =
          state.products.where((product) => product.category == category.name).toList();
          return Scaffold(
            appBar: CustomAppBar(title: category.name),
            bottomNavigationBar: CustomNavBar(),
            body: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ProductCard(
                    product: categoryProducts[index],
                    widthFactor: 2.2,
                  ),
                );
              },
            ),
          );
        }
        return Scaffold(
          appBar: CustomAppBar(title: category.name),
          bottomNavigationBar: CustomNavBar(),
          body: Center(child: Text('Something went wrong')),
        );
      },
    );
  }
}
