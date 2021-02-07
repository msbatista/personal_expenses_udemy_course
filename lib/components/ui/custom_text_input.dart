import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;

  CustomTextInput({
    @required this.title,
    @required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: this.title,
      ),
      controller: this.textEditingController,
    );
  }
}
