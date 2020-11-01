import 'package:flutter/material.dart';

class CCButton extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry edgeInsets;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  const CCButton(
      {Key key,
      @required this.height,
      this.width,
      @required this.color,
      @required this.child,
      @required this.onPressed,
      this.edgeInsets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      padding: this.edgeInsets,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(8.00),
      ),
      child: FlatButton(
        onPressed: this.onPressed,
        child: this.child,
      ),
    );
  }
}
