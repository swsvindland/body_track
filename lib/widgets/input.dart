import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key,
      required this.label,
      this.validator,
      this.controller,
      this.decimal,
      this.variant})
      : super(key: key);
  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool? decimal;
  final String? variant;

  @override
  Widget build(BuildContext context) {
    var color = variant == null ? Colors.white : Colors.pink;

    return Padding(
      padding: EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        // The validator receives the text that the user has entered.
        validator: validator,
        style: TextStyle(color: color),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: BorderSide(color: color),
            ),
            focusedBorder: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: BorderSide(color: color),
            ),
            border: OutlineInputBorder(),
            labelText: label,
            labelStyle: new TextStyle(color: color)),
        keyboardType: TextInputType.numberWithOptions(
            decimal: decimal == null ? true : decimal),
      ),
    );
  }
}
