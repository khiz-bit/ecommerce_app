import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget  {
  static const String routeName = '/splash';

  // Will assign route
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/login'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://www.pngkit.com/png/detail/364-3642224_clarity-ecommerce-logo-logo-e-commerce-png.png',

            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            color: Colors.grey.shade400,
            child: Text('Welcome To Our Store!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}