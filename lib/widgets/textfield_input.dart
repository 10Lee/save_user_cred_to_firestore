import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInput extends StatelessWidget {
  TextEditingController textEditingController;
  String hint;
  bool isPass;
  TextInputType keyboardType;

  TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hint,
    this.isPass = false,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hint,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      obscureText: isPass,
      keyboardType: keyboardType,
    );
  }
}
