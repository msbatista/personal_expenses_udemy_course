import 'package:flutter/material.dart';

import './components/chart.dart';
import './components/transaction_container.dart';

import './model/transaction.dart';

void main() => runApp(PersonalExpenses());

List<Transaction> getTransactions() => [
      Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 69.99,
        transactionDate: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'New Fan',
        amount: 100.50,
        transactionDate: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'New Book',
        amount: 25.50,
        transactionDate: DateTime.now(),
      )
    ];

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
  final List<Transaction> transactions = getTransactions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Exepenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(),
          TransactionContainer(
            transactions: transactions,
          ),
        ],
      ),
    );
  }
}
