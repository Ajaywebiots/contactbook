import 'package:flutter/material.dart';
class TextFieldCommon extends StatelessWidget {
  final String? hintText, errorText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final double? vertical;
  final InputBorder? border;

  // final String? errorText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final String? counterText;
  final GestureTapCallback? onTap;
  final bool? readOnly;

  const TextFieldCommon({
    Key? key,
    this.hintText,
    this.errorText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.border,
    this.obscureText = false,
    this.fillColor,
    this.vertical,
    this.keyboardType,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.counterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Text field common
    return TextFormField(
        maxLines: maxLines ?? 1,
        style: const TextStyle(color:Colors.black),
        focusNode: focusNode,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onTap: onTap,
        readOnly: readOnly ?? false,
        controller: controller,
        onChanged: onChanged,
        minLines: minLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: '',
          errorMaxLines: 1,
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.red),
          isDense: true,
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.symmetric(
              vertical: vertical ?? 17.0, horizontal: 15.0),
          hintText: hintText,
          hintStyle: const TextStyle(color:Color(0xff767676)),
          labelStyle:
              const TextStyle(color: Color(0xff767676)),
        ));
  }
}
