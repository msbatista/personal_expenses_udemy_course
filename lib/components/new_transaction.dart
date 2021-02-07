import 'package:flutter/material.dart';
import '../shared/custom_text_input.dart';
import '../shared/custom_numeric_input.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

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
            CustomNumericInput(
              title: 'Amount',
              textEditingController: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => {
                if (titleController.text.isNotEmpty &&
                    amountController.text.isNotEmpty)
                  {
                    addNewTransaction(
                      titleController.text,
                      double.tryParse(amountController.text),
                    )
                  }
              },
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
