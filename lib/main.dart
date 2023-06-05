import 'package:ecommerce_app/blocs/blocs.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:ecommerce_app/repositories/product/product_repository.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/app_router.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
          create: (_) => CategoryBloc(
              categoryRepository: CategoryRepository()
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
              productRepository: ProductRepository()
          )..add(LoadProducts()),
        ),
        BlocProvider(create: (_) => AppBloc()),
      ],
      child: MaterialApp(
        title: 'Ecommerce App',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
