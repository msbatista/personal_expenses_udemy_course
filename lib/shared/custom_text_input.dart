import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final Function onSubmit;

  CustomTextInput({
    @required this.title,
    @required this.textEditingController,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (_) {
        if (this.onSubmit != null) {
          this.onSubmit();
        }
      },
      decoration: InputDecoration(
        labelText: this.title,
      ),
      controller: this.textEditingController,
    );
  }
}
