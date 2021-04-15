import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _tempMyTheme = ThemeData.from(
  colorScheme: ColorScheme.light(
    primary: Colors.cyan,
    background: Colors.cyan[50]!,
  ),
  textTheme:
      GoogleFonts.sawarabiGothicTextTheme(Typography.material2018().black),
);

final myTheme = _tempMyTheme.copyWith(primaryTextTheme: _primaryTextTheme);

// AppBar内で適用されるTextTheme
// titleはheadline6, TabのtextはbodyText1にあるTextStyleが適用される
final _primaryTextTheme =
    GoogleFonts.sawarabiGothicTextTheme(_tempMyTheme.primaryTextTheme).copyWith(
  headline6: GoogleFonts.niconne(
    textStyle: _tempMyTheme.primaryTextTheme.headline6!.copyWith(
      fontSize: 32,
      shadows: [const Shadow(offset: Offset(2, 2), blurRadius: 4)],
      color: Colors.yellow,
    ),
  ),
);
