import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class StyleBkav {
  static TextStyle textStyleFW400(Color? color, double? size,
      {TextOverflow? overflow, double? height, TextDecoration? decoration}) {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.w400,
            overflow: overflow ?? TextOverflow.ellipsis,
            height: height ?? 1));
  }

  static TextStyle textStyleFW500(Color? color, double? size,
      {TextOverflow? overflow, double? height}) {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.w500,
            overflow: overflow ?? TextOverflow.ellipsis,
            height: height ?? 1));
  }

  static TextStyle textStyleFW600(Color? color, double? size,
      {TextOverflow? overflow, double? height}) {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.w600,
            overflow: overflow ?? TextOverflow.ellipsis,
            height: height ?? 1));
  }

}