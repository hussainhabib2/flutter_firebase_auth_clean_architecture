import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import 'custom_text.dart';

class TextFieldWidget extends StatelessWidget {
  final String? title, hint, label, prefixIconPath, suffixString;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? Function(String?)? validation;
  final Color? borderColor, fillColor, textColor, hintColor, errorColor;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Widget? suffixIcon, prefixWidget;
  final int? maxLength;
  final double? width;
  final bool? enabled, obscureText, read, showAsterik;
  final VoidCallback? onTap;
  final bool autoFocus, showLabel;
  final Function(String)? onChanged;
  final double? borderRadius, hintFontSize, fontSize, borderWidth;

  const TextFieldWidget({
    super.key,
    this.hint,
    this.label,
    this.autoFocus = false,
    this.title,
    this.showLabel = true,
    this.onTap,
    this.width,
    this.prefixWidget,
    this.onChanged,
    this.focusNode,
    this.prefixIconPath,
    this.controller,
    this.validation,
    this.maxLines,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.fontWeight,
    this.hintColor,
    this.fillColor,
    this.suffixString,
    this.errorColor,
    this.inputFormatters,
    this.enabled = true,
    this.obscureText = false,
    this.contentPadding,
    this.hintFontSize,
    this.fontSize,
    this.textInputType,
    this.suffixIcon,
    this.borderWidth,
    this.read = false,
    this.showAsterik = false,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      width: width,
      height: 50,
      child: Center(
        child: SizedBox(
          height: 40,
          child: TextFormField(
            enabled: enabled,
            onChanged: onChanged,
            readOnly: read!,
            autofocus: autoFocus,
            maxLength: maxLength,
            onTap: onTap,
            style: GoogleFonts.poppins(
              fontSize: fontSize ?? 15.0,
              color: textColor ?? AppColors.TITLE_COLOR.withOpacity(0.7),
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
            textAlignVertical: TextAlignVertical.top,
            obscureText: obscureText!,
            controller: controller,
            focusNode: focusNode,
            autovalidateMode: AutovalidateMode.disabled,
            textInputAction:
                focusNode != null ? TextInputAction.next : TextInputAction.done,
            keyboardType: textInputType ?? TextInputType.text,
            cursorColor: AppColors.CAPTION_COLOR,
            cursorHeight: 20,
            // textAlignVertical: TextAlignVertical.center,
            validator: validation,
            inputFormatters: inputFormatters,
            maxLines: maxLines ?? 1,
            decoration: inputDecoration(context),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(context) {
    return InputDecoration(
      contentPadding:
          contentPadding ?? const EdgeInsets.symmetric(horizontal: 12),
      filled: true,
      fillColor: fillColor ?? AppColors.TEXT_COLOR,
      isDense: true,
      hintStyle: const TextStyle(
        color: AppColors.CAPTION_COLOR,
        fontSize: 14,
      ),
      errorStyle: TextStyle(
        color: errorColor ?? Colors.red,
        fontSize: 10.0,
      ),
      label: showLabel == true
          ? CustomText(
              text: label ?? hint,
              color: AppColors.CAPTION_COLOR,
              fontSize: 13,
            )
          : null,
      hintText: showLabel == false ? hint : null,
      errorMaxLines: 3,
      prefixIconConstraints: const BoxConstraints(minWidth: 50, maxHeight: 50),
      prefixIcon: prefixWidget ??
          (prefixIconPath == null
              ? null
              : Image(
                  width: 18,
                  height: 18,
                  image: AssetImage(prefixIconPath!),
                )),
      suffixIcon: suffixIcon,
      suffixText: suffixString,
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      border: InputBorder.none,
    );
  }
}
