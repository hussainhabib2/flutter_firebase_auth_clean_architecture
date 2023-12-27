import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_flutter_task/core/constants/app_colors.dart';

import 'custom_text.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? width, height, fontSize;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final TextAlign? textAlign;
  final Widget? icon;
  final int? maxLines;
  final dynamic border;
  final FontWeight? fontWeight;

  const PrimaryButton({
    super.key,
    this.icon,
    this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.textAlign,
    this.maxLines,
    this.border,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 52,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            color: color ?? AppColors.PRIMARY_COLOR,
            border: border,
          ),
          child: Center(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: icon!,
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 8,
                    child: CustomText(
                      text: text ?? "",
                      textAlign: textAlign ??
                          (icon != null ? TextAlign.start : TextAlign.center),
                      maxLines: maxLines ?? 1,
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16,
                      fontWeight: fontWeight ?? FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
