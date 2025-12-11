import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController tec;
  String label;
  TextFieldWidget({super.key, required this.tec, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      decoration: InputDecoration(
        hintText: "Enter $label",
        labelText: label,
        fillColor: Colors.white,

      ),
    );
  }
}
