import 'dart:io';

import 'package:flutter/widgets.dart';

class CustomWillPopScope extends StatelessWidget {
  final WillPopCallback onWillPop;
  final Widget child;

  const CustomWillPopScope({
    Key? key,
    required this.onWillPop,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return WillPopScope(child: child, onWillPop: onWillPop);
    } else {
      return GestureDetector(
        onHorizontalDragUpdate: (details) async {
          int sensitivity = 15;

          if (details.delta.dx > sensitivity) {
            if (await onWillPop()) {
              Navigator.of(context).pop();
            };
          }
        },
        child: WillPopScope(
          onWillPop: ()async{
            return false;
          },
          child: child,
        ),
      );
    }
  }
}
