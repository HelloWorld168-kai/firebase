import 'package:cli_firebase/pages/utils/themes_color.dart';
import 'package:flutter/material.dart';

/// <b>Typographies</b> <br/>
/// It's for use with Text

abstract class Typographies {
  TextStyle display({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
  TextStyle title({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
  TextStyle paragraph({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
  TextStyle label({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  });
}

final Typographies khtypographies = TypographiesImpl();

class TypographiesImpl implements Typographies {
  final String _fontFamily = "khmer";

  @override
  TextStyle display({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight,
      fontSize: 20,
    );
  }

  @override
  TextStyle label({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight,
      fontSize: 14,
    );
  }

  @override
  TextStyle paragraph({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight,
      fontSize: 16,
    );
  }

  @override
  TextStyle title({
    Color? color,
    FontWeight? fontWeight,
    int? maxLine,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight,
      fontSize: 18,
    );
  }
}
