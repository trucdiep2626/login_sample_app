import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';

class AppText extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final EdgeInsets margin;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final bool? softWrap;
  final double? maxFontSize;
  final double? minFontSize;

  const AppText(
    this.text, {
    super.key,
    this.textOverflow,
    this.softWrap,
    this.margin = EdgeInsets.zero,
    this.style,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.maxLines,
    this.maxFontSize,
    this.minFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: AutoSizeText(
          text,
          minFontSize: minFontSize ?? AppDimens.space_12,
          maxFontSize: maxFontSize ?? AppDimens.space_40,
          stepGranularity: AppDimens.space_1,
          maxLines: maxLines,
          overflow: textOverflow,
          softWrap: softWrap,
          textAlign: textAlign,
          style: style,
        ),
      ),
    );
  }
}
