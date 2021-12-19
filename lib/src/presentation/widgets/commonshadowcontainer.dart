import 'package:flutter/material.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';

class CommonShadowContainer extends StatelessWidget {
  const CommonShadowContainer({
    Key? key,
    this.alignment,
    this.padding,
    this.color,
    this.foregroundDecoration,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.width,
    this.height,
  }) : super(key: key);
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  final Decoration? foregroundDecoration;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        height: height,
        width: width,
        transformAlignment: transformAlignment,
        margin: margin,
        foregroundDecoration: foregroundDecoration,
        decoration: BoxDecoration(
          color: ColorUtils.kcWhite,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(-1, 7),
                blurRadius: 39,
                color: ColorUtils.kcTransparent.withOpacity(.13))
          ],
        ),
        color: color,
        padding: padding,
        alignment: alignment);
  }
}
