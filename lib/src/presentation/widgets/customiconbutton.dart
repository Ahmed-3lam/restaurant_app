import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double? size;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const CustomIconButton(
      {Key? key,
      this.size = 24,
      required this.onTap,
      this.padding,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: MaterialButton(
        child: child,
        onPressed: onTap,
        padding: padding ?? EdgeInsets.zero,
      ),
    );
  }
}
