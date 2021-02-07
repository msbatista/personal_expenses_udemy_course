import 'package:flutter/material.dart';
import '../shared/custom_text_input.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CustomTextInput(
              title: 'Title',
              textEditingController: titleController,
            ),
            CustomTextInput(
              title: 'Amount',
              textEditingController: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
