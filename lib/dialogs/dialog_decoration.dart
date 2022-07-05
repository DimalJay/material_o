import 'package:flutter/material.dart';

const _padding = 16.0;
const _borderradius = 16.0;
const _fontSize = 20.0;

class DialogDecoration {
  final BoxBorder? thumbBorder;
  final TextStyle? headerStyle;
  final TextStyle? contentStyle;
  final double? iconSize;
  final ShapeBorder? shape;
  final double? elevation;
  final BorderRadius? thumbBorderRadius;
  final TextAlign? textAlign;
  final BorderRadius? buttonBorderRadius;
  final double? buttonElevation;
  final TextStyle? buttonTextStyle;
  final Color? buttonForegroundTextColor;
  final EdgeInsets? buttonPadding;
  final double? secondaryButtonBorderWidth;

  DialogDecoration({
    this.thumbBorder,
    this.headerStyle,
    this.contentStyle,
    this.iconSize,
    this.shape,
    this.elevation,
    this.thumbBorderRadius,
    this.textAlign,
    this.buttonBorderRadius,
    this.buttonElevation,
    this.buttonTextStyle,
    this.buttonForegroundTextColor,
    this.buttonPadding,
    this.secondaryButtonBorderWidth,
  });

  factory DialogDecoration.defaultValue() => DialogDecoration(
        elevation: 0.0,
        buttonElevation: 0.0,
        buttonForegroundTextColor: Colors.white,
        buttonTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        iconSize: 50,
        buttonBorderRadius: BorderRadius.circular(
          _borderradius * .6,
        ),
        secondaryButtonBorderWidth: 1,
        textAlign: TextAlign.center,
        thumbBorder: Border.all(
          width: 1,
          color: Colors.grey.shade400,
        ),
        thumbBorderRadius: BorderRadius.circular(
          _borderradius,
        ),
        headerStyle: const TextStyle(
          fontSize: _fontSize,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderradius),
        ),
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: _padding / 3,
          vertical: _padding / 3,
        ),
      );
}
