import 'package:flutter/material.dart';

class BangerNavigationBar extends StatelessWidget {
  final Widget titleWidget;
  final Widget actionsWidget;
  final Function()? onBackButtonPressed;

  const BangerNavigationBar({
    Key? key,
    required this.titleWidget,
    required this.actionsWidget,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigation row with a back button and a title
    return Row(
      children: [
        IconButton(
          onPressed: () {
            onBackButtonPressed != null
                ? onBackButtonPressed!.call()
                : Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleWidget,
        const SizedBox(width: 16),
        actionsWidget,
        const SizedBox(width: 16),
      ],
    );
  }
}
