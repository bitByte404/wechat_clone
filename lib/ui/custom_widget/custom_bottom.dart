import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../value/colors.dart';

enum ButtonColorType {
  green,
  white,
  grey,
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.lable,
      this.colorType = ButtonColorType.green,
      this.padding,
      this.width});
  final void Function()? onTap;
  final String lable;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final ButtonColorType colorType;

  @override
  Widget build(BuildContext context) {
    Color textColor;
    Color backgroundColor;
    switch (colorType) {
      case ButtonColorType.green:
        textColor = Colors.white;
        backgroundColor = AppColors.primaryColor;
        break;
      case ButtonColorType.white:
        textColor = Colors.black;
        backgroundColor = Colors.white;
        break;
      case ButtonColorType.grey:
        textColor = Colors.black;
        backgroundColor = AppColors.colorGrey;
        break;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: width == null
              ? IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 12, left: 35, right: 35, bottom: 12),
                    color: backgroundColor,
                    child: Center(
                      child: Text(
                        lable,
                        style: TextStyle(color: textColor, fontSize: 18),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: width,
                  padding: const EdgeInsets.only(
                      top: 12, left: 35, right: 35, bottom: 12),
                  color: backgroundColor,
                  child: Center(
                    child: Text(
                      lable,
                      style: TextStyle(color: textColor, fontSize: 18),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
