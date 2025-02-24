import 'package:cli_firebase/controller/aba_service_controller.dart';
import 'package:flutter/material.dart';

late final ControllerAba controller;

class AppColors {
  final filteredList = controller.aba
      .where(
        (item) => item.id >= 12 && item.id <= 19,
      )
      .toList();

  static const Color primary = Color(0xFF023048);
  static const Color dark = Colors.black;
  static const Color secondary = Color(0xFF067394);
}

// ignore: non_constant_identifier_names
Text AppText(
  String text, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  TextAlign? textAlign,
  String? imageUrl,
}) =>
    Text(
      text,
      style: TextStyle(
        fontFamily: "pp",
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.dark,
      ),
      textAlign: textAlign,
    );
