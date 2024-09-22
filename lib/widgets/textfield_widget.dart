import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/utils/app_text_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? camefromScreen;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool obscureText;
  final String? labelText;
  final void Function(String str)? onChangedValue;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final int? inputCharacterLimit;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? hintText;
  final Color? cursorColor;
  final bool? isenabled;
  final InputDecoration? decoration;
  final Function()? onTap;
  final void Function(String str)? onSubmitted;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.keyboardType,
    this.readOnly = false,
    this.labelText,
    this.validator,
    this.inputCharacterLimit,
    this.autovalidateMode,
    this.textInputAction,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.obscureText = false,
    this.onChangedValue,
    this.inputFormatters,
    this.maxLines,
    this.camefromScreen,
    this.isenabled,
    this.onSubmitted,
    this.onTap,
    this.hintText,
    this.cursorColor,
    this.contentPadding,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isenabled,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      readOnly: readOnly,
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChangedValue,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:  AppTextStyles.coloredRegular(Colors.black, FontWeight.w400, 14),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        labelText: labelText,
        isDense: true,
        contentPadding: contentPadding,
        errorBorder: OutlineInputBorder(
          borderRadius:
              // BorderRadius.circular(ScreenUtilWrapper.setResponsiveSize(12)),
              BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kcRedColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              // BorderRadius.circular(ScreenUtilWrapper.setResponsiveSize(12)),
              BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kcRedColor, width: 1.0),
        ),
        errorStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: kcRedColor,
              fontSize: 10,
            ),
        errorMaxLines: 3,
        labelStyle: Theme.of(context).textTheme.displaySmall,
        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius:
              // BorderRadius.circular(ScreenUtilWrapper.setResponsiveSize(12)),
              BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.white ,width: 1.0),
            borderRadius: BorderRadius.circular(12.0)),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              // BorderRadius.circular(ScreenUtilWrapper.setResponsiveSize(12)),
              BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
      ),
    );
  }
}
