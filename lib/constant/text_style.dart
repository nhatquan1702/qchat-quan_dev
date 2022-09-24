import 'package:chat_app/constant/color.dart';
import 'package:flutter/material.dart';

class ConstantFontFamily {
  static String bold = "SourceSansPro-Bold";
  static String extraLight = "SourceSansPro-ExtraLight";
  static String extraLightItalic = "SourceSansPro-ExtraLightItalic";
  static String light = "SourceSansPro-Light";
  static String regular = "SourceSansPro-Regular";
  static String semiBold = "SourceSansPro-SemiBold";
}

/*class ConstantTextStyle {
  static TextStyle boldTextFont({Color? color, double? fontSize}) => TextStyle(
      fontFamily: ConstantFontFamily.bold,
      fontSize: fontSize ?? CoreFontSize.defaultSize,
      color: color ?? ConstantColor.textColorLight,
      height: 1.2);

  static TextStyle extraLightTextFont(
      {Color color, double fontSize, TextDecoration textDecoration}) =>
      TextStyle(
          fontFamily: CoreFontFamily.regular,
          decoration: textDecoration ?? TextDecoration.none,
          fontSize: fontSize ?? CoreFontSize.defaultSize,
          color: color ?? CoreColors.text_color,
          height: 1.2);

  static TextStyle extraLightItalicTextFont({Color color, double fontSize}) => TextStyle(
    fontFamily: CoreFontFamily.bold,
    // fontSize: fontSize ?? CoreFontSize.defaultSize,
    fontSize: fontSize ?? CoreFontSize.defaultSize,
    color: color ?? Color(0xff1f274a),
  );

  static TextStyle lightTextFont({Color color, double fontSize}) =>
      TextStyle(
        fontFamily: CoreFontFamily.boldItalic,
        fontSize: fontSize ?? CoreFontSize.defaultSize,
        color: color ?? CoreColors.text_color,
      );

  static TextStyle regularTextFont({Color color, double fontSize}) => TextStyle(
    fontFamily: CoreFontFamily.italic,
    fontSize: fontSize ?? CoreFontSize.defaultSize,
    color: color ?? CoreColors.text_color,
  );
  static TextStyle semiBoldTextFont({Color color, double fontSize}) => TextStyle(
    fontFamily: CoreFontFamily.italic,
    fontSize: fontSize ?? CoreFontSize.defaultSize,
    color: color ?? CoreColors.text_color,
  );
}*/

class CoreFontSize {
  static double defaultSize = 16.0; // Kích cỡ mặc định
  static double titleSize = defaultSize + 10.0; // Kích cỡ dành cho tiêu đề
}

