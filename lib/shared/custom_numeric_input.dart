import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumericInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final Function onSubmit;

  CustomNumericInput({
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
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
      ],
      decoration: InputDecoration(
        labelText: title,
      ),
      controller: textEditingController,
    );
  }
}
