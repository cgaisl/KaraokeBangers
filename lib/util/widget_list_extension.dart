import 'package:flutter/widgets.dart';

extension InsertBetween on Iterable<Widget> {
  List<Widget> insertBetween(Widget insertable) {
    return expand((widget) => [widget, insertable])
        .toList()..removeLast();
  }
}
