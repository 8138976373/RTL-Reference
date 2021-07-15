import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double? height;
  double? width;
  double? radius;
  double? elevation;
  Color? bgColor;
  String? text;
  double? size;
  Color? textColor;
  double? margin;
  double? marginRight;
  double? marginLeft;
  double? marginBottom;
  double? marginTop;
  double? padding;
  double? paddingRight;
  double? paddingLeft;
  double? paddingBottom;
  double? paddingTop;
  TextAlign? textAlignment;
  FontWeight? fontWeight;
  MainAxisAlignment? alignment;
  Widget? child;
  VoidCallback? onPressed;

  CustomButton({
    Key? key,
    this.text,
    this.size,
    this.bgColor,
    this.textColor,
    this.margin,
    this.marginLeft,
    this.marginRight,
    this.marginTop,
    this.marginBottom,
    this.padding,
    this.paddingBottom,
    this.paddingRight,
    this.paddingTop,
    this.paddingLeft,
    this.radius,
    this.height,
    this.width,
    this.alignment,
    this.fontWeight,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  MainAxisAlignment? setAlignment() {
    if (alignment == null) {
      return this.alignment = MainAxisAlignment.start;
    } else {
      return this.alignment;
    }
  }

  TextAlign? setTextAlignment() {
    if (textAlignment == null) {
      return this.textAlignment = TextAlign.left;
    } else {
      return this.textAlignment;
    }
  }

  Color? setColor() {
    if (this.textColor == null) {
      return this.textColor = Colors.black;
    } else {
      return this.textColor;
    }
  }

  Color? setBgColor() {
    if (this.bgColor == null) {
      return this.bgColor = Colors.black;
    } else {
      return this.bgColor;
    }
  }

  Color? setTextColor() {
    if (this.textColor == 0 || this.textColor == null) {
      return this.textColor = Colors.black;
    } else {
      return this.textColor;
    }
  }

  EdgeInsetsGeometry? setMargin() {
    if (this.margin == 0 || this.margin == null) {
      if (this.marginBottom == 0 || this.margin == null) {
        this.marginBottom = 0;
      }
      if (this.marginTop == 0 || this.margin == null) {
        this.marginTop = 0;
      }
      if (this.marginRight == 0 || this.margin == null) {
        this.marginRight = 0;
      }
      if (this.marginLeft == 0 || this.margin == null) {
        this.marginLeft = 0;
      }
      return EdgeInsets.fromLTRB(
          marginLeft!, marginTop!, marginRight!, marginBottom!);
    } else {
      return EdgeInsets.all(this.margin!);
    }
  }

  EdgeInsetsGeometry? setPadding() {
    if (this.padding == 0 || this.padding == null) {
      if (this.paddingBottom == 0 || this.paddingBottom == null) {
        this.paddingBottom = 0;
      }
      if (this.paddingTop == 0 || this.paddingTop == null) {
        this.paddingTop = 0;
      }
      if (this.paddingRight == 0 || this.paddingRight == null) {
        this.paddingRight = 0;
      }
      if (this.paddingLeft == 0 || this.paddingLeft == null) {
        this.paddingLeft = 0;
      }
      return EdgeInsets.fromLTRB(
          paddingLeft!, paddingTop!, paddingRight!, paddingBottom!);
    } else {
      return EdgeInsets.all(this.padding!);
    }
  }

  double? setRadius() {
    if (this.radius == 0 || this.radius == null) {
      return this.radius = 10.0;
    } else {
      return this.radius;
    }
  }

  FontWeight? setFontWeight() {
    if (textAlignment == null) {
      return this.fontWeight = FontWeight.normal;
    } else {
      return this.fontWeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      margin: setMargin(),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // <-- Radius
        ),
        height: this.height,
        minWidth: this.width,
        elevation: this.elevation,
        color: setBgColor(),
        onPressed: onPressed,
        child: child!,
      ),
    );
  }
}