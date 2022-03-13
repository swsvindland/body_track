import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({Key? key, required this.label, this.validator, this.controller}) : super(key: key);
  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(4),
     child: TextFormField(
      controller: controller,
      // The validator receives the text that the user has entered.
      validator: validator,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(),
          labelText: label,
          labelStyle: new TextStyle(color: Colors.white)
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    ),
    );
  }
}
