import 'package:flutter/material.dart';

import './components/chart.dart';
import './components/transaction_container.dart';
import './components/new_transaction.dart';

void main() => runApp(PersonalExpenses());

class PersonalExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses App',
      home: PersonalExpensesHomePage(),
    );
  }
}

class PersonalExpensesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        children: <Widget>[
          Chart(),
          NewTransaction(),
          TransactionContainer(),
        ],
      ),
    );
  }
}
