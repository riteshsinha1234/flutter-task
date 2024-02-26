import 'package:flutter/material.dart';

// APP COLORS --------->>>
const black = Color(0xFF000000);
const onboard = Color(0xFF261C12);
const lightgrey = Color(0xFFB3B3B3);
const textField = Color(0xFF808080);
const container = Color(0xFFD8D8D8);
const white = Color(0xFFFFFFFF);
const green = Color(0xFF5EA25F);
const brown = Color(0xFFD5715B);
const yellow = Color(0xFFF8C569);
const green2 = Color(0xFF00CB14);

// LIGHT TEXTS --------->>>
// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  Color color;
  double size;

  FontWeight weight;
  bool underline;

  CustomText(this.text, this.color, this.size, this.weight, this.underline,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none),
    );
  }
}

// ignore: must_be_immutable
class ParagraphText extends StatelessWidget {
  String text;
  Color color;
  double size;
  String family;
  FontWeight weight;
  TextAlign alignment;

  ParagraphText(this.text, this.color, this.size, this.family, this.weight,
      this.alignment,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          color: color, fontSize: size, fontWeight: weight, fontFamily: family),
    );
  }
}

class ImagePath {
  static String base = "assets/images/";
  //// APP IMAGES PATHS------------------->>>>
  static String logo = "${base}logo.png";
  static String vendor = "${base}vendor.png";
}

class Product {
  String name;
  String? value;

  Product(this.name, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
