import 'package:flutter/material.dart';

import '../../../../../../common/theme/app_css.dart';

class CustomAmountFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final GestureTapCallback? onTap;

  const CustomAmountFormField({
    Key? key,
    required this.controller,
    this.hintText = "Amount",
    this.validator,
    this.keyboardType,
    this.readOnly, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(Insets.i0, Insets.i20, Insets.i0, Insets.i10),
        child: TextFormField(
            readOnly: readOnly ?? false,
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(hintText: hintText),
            validator: validator));
  }
}
