import 'package:flutter/material.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';
import 'package:resturant_side/src/presentation/constatns/textstyle.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String tittle,
}) {
  return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: ColorUtils.kcBlueButton,
      title: Text(
        tittle,
        style: FontStyleUtilities.h4(
          fontWeight: FWT.bold,
        ),
      ));
}
