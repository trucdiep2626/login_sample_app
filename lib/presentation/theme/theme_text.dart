import 'package:flutter/material.dart';
import 'package:login_sample_app/common/utils/app_screen_utils/flutter_screenutils.dart';
import 'theme_color.dart';

class ThemeText {
  /// Text style
  static final TextStyle bodyRegular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.grey4,
  );

  static final TextStyle bodyMedium = bodyRegular.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodySemibold = bodyRegular.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bodyStrong = bodyRegular.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodyUnderline = bodyRegular.copyWith(
    decoration: TextDecoration.underline,
  );

  static final TextStyle bodyStrikethrough = bodyRegular.copyWith(
    decoration: TextDecoration.lineThrough,
  );

  static final TextStyle bodyItalic = bodyRegular.copyWith(
    fontStyle: FontStyle.italic,
  );

  static final TextStyle description = bodyRegular.copyWith(
    fontSize: 12.sp,
  );

  static final TextStyle bodySmall = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
    color: AppColors.black,
  );

  static final TextStyle heading1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
    color: AppColors.black,
  );

  static final TextStyle heading2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: AppColors.black,
  );

  static final TextStyle heading3 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: AppColors.black,
  );

  static final TextStyle heading4 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: AppColors.black,
  );

  static final TextStyle errorText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
    color: AppColors.red,
  );
}

extension CommonFontWeight on TextStyle {
  /// FontWeight.w100
  TextStyle w100([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w100,
        fontSize: fontSize,
      );

  /// FontWeight.w200
  TextStyle w200([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
      );

  /// FontWeight.w300
  TextStyle w300([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
      );

  /// FontWeight.w400
  TextStyle w400([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      );

  /// FontWeight.w500
  TextStyle w500([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );

  /// FontWeight.w600
  TextStyle w600([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );

  /// FontWeight.w700
  TextStyle w700([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      );

  /// FontWeight.w800
  TextStyle w800([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
      );

  /// FontWeight.w900
  TextStyle w900([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
      );
}

extension CommonFontSize on TextStyle {
  /// custom fontSize
  TextStyle fSize(double fontSize) => copyWith(
        fontSize: fontSize,
      );

  /// fontSize: 8
  TextStyle get s8 => copyWith(
        fontSize: 8.sp,
      );

  /// fontSize: 10
  TextStyle get s10 => copyWith(
        fontSize: 10.sp,
      );

  /// fontSize: 12
  TextStyle get s12 => copyWith(
        fontSize: 12.sp,
      );

  /// fontSize: 13
  TextStyle get s13 => copyWith(
        fontSize: 13.sp,
      );

  /// fontSize: 14
  TextStyle get s14 => copyWith(
        fontSize: 14.sp,
      );

  /// fontSize: 15
  TextStyle get s15 => copyWith(
        fontSize: 15.sp,
      );

  /// fontSize: 16
  TextStyle get s16 => copyWith(
        fontSize: 16.sp,
      );

  /// fontSize: 17
  TextStyle get s17 => copyWith(
        fontSize: 17.sp,
      );

  /// fontSize: 18
  TextStyle get s18 => copyWith(
        fontSize: 18.sp,
      );

  /// fontSize: 20
  TextStyle get s20 => copyWith(
        fontSize: 20.sp,
      );

  /// fontSize: 24
  TextStyle get s24 => copyWith(
        fontSize: 24.sp,
      );

  /// fontSize: 26
  TextStyle get s26 => copyWith(
    fontSize: 26.sp,
  );

  /// fontSize: 28
  TextStyle get s28 => copyWith(
    fontSize: 28.sp,
  );

  /// fontSize: 30
  TextStyle get s30 => copyWith(
    fontSize: 30.sp,
  );

  /// fontSize: 32
  TextStyle get s32 => copyWith(
        fontSize: 32.sp,
      );

  /// fontSize: 36
  TextStyle get s36 => copyWith(
        fontSize: 36.sp,
      );

  /// fontSize: 40
  TextStyle get s40 => copyWith(
        fontSize: 40.sp,
      );

  /// fontSize: 48
  TextStyle get s48 => copyWith(
        fontSize: 48.sp,
      );
}

extension CommonFontColor on TextStyle {
  /// custom color
  TextStyle setColor(Color? color) => copyWith(color: color);

  /// color: AppColors.white,
  TextStyle get white => copyWith(color: AppColors.white);

  /// color: AppColors.transparent;
  TextStyle get transparentColor => copyWith(color: AppColors.transparent);

  // /// color: AppColors.errorColor2;
  // TextStyle get errorColor2 => copyWith(color: AppColors.errorColor2);

  /// color: AppColors.primary,
  TextStyle get primary => copyWith(color: AppColors.primary);

  /// color: AppColors.background,
  TextStyle get background => copyWith(color: AppColors.background);

  /// color: AppColors.black,
  TextStyle get black => copyWith(color: AppColors.black);

  /// color: AppColors.red,
  TextStyle get red => copyWith(color: AppColors.red);

  /// color: AppColors.black45,
  TextStyle get black45 => copyWith(color: AppColors.black45);

  /// color: AppColors.grey0,
  TextStyle get grey0 => copyWith(color: AppColors.grey0);

  /// color: AppColors.grey0.5,
  TextStyle get grey0_5 => copyWith(color: AppColors.grey0_5);

  /// color: AppColors.grey1,
  TextStyle get grey1 => copyWith(color: AppColors.grey1);

  /// color: AppColors.grey1.5,
  TextStyle get grey1_5 => copyWith(color: AppColors.grey1_5);

  /// color: AppColors.grey2,
  TextStyle get grey2 => copyWith(color: AppColors.grey2);

  /// color: AppColors.grey3,
  TextStyle get grey3 => copyWith(color: AppColors.grey3);

  /// color: AppColors.grey4,
  TextStyle get grey4 => copyWith(color: AppColors.grey4);

  /// color: AppColors.grey5,
  TextStyle get grey5 => copyWith(color: AppColors.grey5);

  /// color: AppColors.grey6,
  TextStyle get grey6 => copyWith(color: AppColors.grey6);

  /// color: AppColors.grey7,
  TextStyle get grey7 => copyWith(color: AppColors.grey7);

  /// color: AppColors.grey8,
  TextStyle get grey8 => copyWith(color: AppColors.grey8);

  /// color: AppColors.grey8.5,
  TextStyle get grey8_5 => copyWith(color: AppColors.grey8_5);

  /// color: AppColors.grey9,
  TextStyle get grey9 => copyWith(color: AppColors.grey9);

  /// color: AppColors.grey9.5,
  TextStyle get grey9_5 => copyWith(color: AppColors.grey9_5);

  /// color: AppColors.grey10,
  TextStyle get grey10 => copyWith(color: AppColors.grey10);

  /// color: AppColors.orange0,
  TextStyle get orange => copyWith(color: AppColors.orange);

  /// color: AppColors.orange0.5,
  TextStyle get orange0_5 => copyWith(color: AppColors.orange0_5);

  /// color: AppColors.orange1,
  TextStyle get orange1 => copyWith(color: AppColors.orange1);

  /// color: AppColors.orange1.5,
  TextStyle get orange1_5 => copyWith(color: AppColors.orange1_5);

  /// color: AppColors.orange2,
  TextStyle get orange2 => copyWith(color: AppColors.orange2);

  /// color: AppColors.orange3,
  TextStyle get orange3 => copyWith(color: AppColors.orange3);

  /// color: AppColors.orange4,
  TextStyle get orange4 => copyWith(color: AppColors.orange4);

  /// color: AppColors.orange5,
  TextStyle get orange5 => copyWith(color: AppColors.orange5);

  /// color: AppColors.orange6,
  TextStyle get orange6 => copyWith(color: AppColors.orange6);

  /// color: AppColors.orange7,
  TextStyle get orange7 => copyWith(color: AppColors.orange7);

  /// color: AppColors.orange8,
  TextStyle get orange8 => copyWith(color: AppColors.orange8);

  /// color: AppColors.orange8.5,
  TextStyle get orange8_5 => copyWith(color: AppColors.orange8_5);

  /// color: AppColors.orange9,
  TextStyle get orange9 => copyWith(color: AppColors.orange9);

  /// color: AppColors.orange9.5,
  TextStyle get orange9_5 => copyWith(color: AppColors.orange9_5);

  /// color: AppColors.orange10,
  TextStyle get orange10 => copyWith(color: AppColors.orange10);

  /// color: AppColors.blue,
  TextStyle get blue => copyWith(color: AppColors.blue);

  /// color: AppColors.blue50,
  TextStyle get blue50 => copyWith(color: AppColors.blue50);

  /// color: AppColors.blue100,
  TextStyle get blue100 => copyWith(color: AppColors.blue100);

  /// color: AppColors.blue200,
  TextStyle get blue200 => copyWith(color: AppColors.blue200);

  /// color: AppColors.blue300,
  TextStyle get blue300 => copyWith(color: AppColors.blue300);

  /// color: AppColors.blue400,
  TextStyle get blue400 => copyWith(color: AppColors.blue400);

  /// color: AppColors.blue500,
  TextStyle get blue500 => copyWith(color: AppColors.blue500);

  /// color: AppColors.blue600,
  TextStyle get blue600 => copyWith(color: AppColors.blue600);

  /// color: AppColors.blue700,
  TextStyle get blue700 => copyWith(color: AppColors.blue700);

  /// color: AppColors.blue800,
  TextStyle get blue800 => copyWith(color: AppColors.blue800);

  /// color: AppColors.blue900,
  TextStyle get blue900 => copyWith(color: AppColors.blue900);

  /// color: AppColors.blue10,
  TextStyle get blue10 => copyWith(color: AppColors.blue10);

  /// color: AppColors.purple0,
  TextStyle get purple0 => copyWith(color: AppColors.purple0);

  /// color: AppColors.purple0.5,
  TextStyle get purple0_5 => copyWith(color: AppColors.purple0_5);

  /// color: AppColors.purple1,
  TextStyle get purple1 => copyWith(color: AppColors.purple1);

  /// color: AppColors.purple1.5,
  TextStyle get purple1_5 => copyWith(color: AppColors.purple1_5);

  /// color: AppColors.purple2,
  TextStyle get purple2 => copyWith(color: AppColors.purple2);

  /// color: AppColors.purple3,
  TextStyle get purple3 => copyWith(color: AppColors.purple3);

  /// color: AppColors.purple4,
  TextStyle get purple4 => copyWith(color: AppColors.purple4);

  /// color: AppColors.purple5,
  TextStyle get purple5 => copyWith(color: AppColors.purple5);

  /// color: AppColors.purple6,
  TextStyle get purple6 => copyWith(color: AppColors.purple6);

  /// color: AppColors.purple7,
  TextStyle get purple7 => copyWith(color: AppColors.purple7);

  /// color: AppColors.purple8,
  TextStyle get purple8 => copyWith(color: AppColors.purple8);

  /// color: AppColors.purple8.5,
  TextStyle get purple8_5 => copyWith(color: AppColors.purple8_5);

  /// color: AppColors.purple9,
  TextStyle get purple9 => copyWith(color: AppColors.purple9);

  /// color: AppColors.purple9.5,
  TextStyle get purple9_5 => copyWith(color: AppColors.purple9_5);

  /// color: AppColors.purple10,
  TextStyle get purple10 => copyWith(color: AppColors.purple10);

  /// color: AppColors.title,
  TextStyle get title => copyWith(color: AppColors.title);

  /// color: AppColors.danger,
  TextStyle get danger => copyWith(color: AppColors.danger);

  /// color: AppColors.green,
  TextStyle get green => copyWith(color: AppColors.green);

  ///underline
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  //italic
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}
