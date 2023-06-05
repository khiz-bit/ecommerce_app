import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(
        icon: Icon(Icons.favorite),
        onPressed:  () {
          Navigator.pushNamed(context, '/wishlist');
        },
      )],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}

