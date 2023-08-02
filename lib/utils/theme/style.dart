
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 8.0;
double maxHeight(context) => MediaQuery.of(context).size.height;
double maxWidth(context) => MediaQuery.of(context).size.width;

Color primaryColor = Color(0xff6BB875);
Color secondaryColor = Color(0xffE2F6E7);
Color greyColorText = Colors.grey.shade500;

TextStyle primaryTextStyle = GoogleFonts.outfit(
    color: primaryColor
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;