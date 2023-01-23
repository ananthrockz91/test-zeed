import 'package:flutter/cupertino.dart';

extension ListWidgetUtils on List<Widget> {
  List<Widget> mapToPadding({required EdgeInsets padding}) {
    return map((Widget child) {
      return Padding(
        padding: padding,
        child: child,
      );
    }).toList();
  }
}
