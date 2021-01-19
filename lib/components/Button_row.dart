import 'package:flutter/material.dart';
import 'Button.dart';

class Buttonrow extends StatelessWidget {
  final List<Button> buttons;
  Buttonrow(this.buttons);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: buttons.fold(<Widget>[], (list, b) {
            list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
            return list;
          })),
    );
  }
}
