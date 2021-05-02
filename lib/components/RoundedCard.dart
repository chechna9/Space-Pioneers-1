import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  RoundedCard({this.color, this.child});
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: child,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    );
  }
}
