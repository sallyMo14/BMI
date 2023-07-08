import 'package:bmi_tt9/constants.dart';
import 'package:flutter/material.dart';
class MYFab extends StatelessWidget {
  const MYFab({super.key,
            required this.onpressed,
            required this.child,
  });
  final Function() onpressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: child,
      shape: CircleBorder(),
      fillColor: fabColor,
      constraints: BoxConstraints(minHeight: 50,minWidth: 50),
      elevation: 10,

    );
  }
}
