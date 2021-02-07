import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumericInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;

  CustomNumericInput({
    @required this.title,
    @required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
