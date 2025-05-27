import 'package:flutter/material.dart';

class DirectionIndicator extends StatelessWidget {
  const DirectionIndicator({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Icon(Icons.south, color: color),
        ),
      ),
    );
  }
}
