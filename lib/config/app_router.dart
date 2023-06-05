import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/models.dart';

class AppRouter {
  // This method will initialize route with route setting and print the route
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is the route: ${settings.name}');

    switch(settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CatalogueScreen.routeName:
        return CatalogueScreen.route(category: settings.arguments as Category);
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      case ForgotPasswordScreen.routeName:
        return ForgotPasswordScreen.route();


      default:
        return _errorRoute();
    }

  }

  static Route _errorRoute() {
    return MaterialPageRoute(
    settings: RouteSettings(name: '/error'),
    builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'),),
    ),
    );
  }
}