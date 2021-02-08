import 'package:flutter/material.dart';
import '../shared/custom_text_input.dart';
import '../shared/custom_numeric_input.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount < 0) {
      return;
    }

    widget.addNewTransaction(title, amount);

    Navigator.of(context).pop();
  }

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
              onSubmit: submitData,
            ),
            CustomNumericInput(
              title: 'Amount',
              textEditingController: amountController,
              onSubmit: submitData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
