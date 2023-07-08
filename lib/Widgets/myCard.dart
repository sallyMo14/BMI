import 'package:flutter/material.dart';

import '../constants.dart';
class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.child,  this.backgroundColor});
  //final Function()? onTab;
  final Widget child;

  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),

      decoration: BoxDecoration(color: backgroundColor,borderRadius: BorderRadius.circular(15)),

      child: child,

    );
  }
}
