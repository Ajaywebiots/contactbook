import 'package:flutter/material.dart';

class CustomAmountFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator? validator;

  const CustomAmountFormField({
    Key? key,
    required this.controller,
    this.hintText = "Amount",
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(hintText: hintText),
            validator: validator));
  }
}
