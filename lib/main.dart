import 'package:flutter/material.dart';

import './model/transaction.dart';
import './utils/datetime/date_utils.dart' as dateUtils;

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
  final List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 69.99,
        transactionDate: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'New Fan',
        amount: 100.50,
        transactionDate: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'New Book',
        amount: 25.50,
        transactionDate: DateTime.now())
  ];
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            height: 200,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          // Card(
          //   color: Colors.blue,
          //   child: Container(width: double.infinity, child: Text('CHART!')),
          //   elevation: 5,
          // ),
          Column(
              children: transactions.map((transaction) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                      child: Text(transaction.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      padding: const EdgeInsets.all(10)),
                  Column(
                    children: [
                      Text(transaction.title),
                      Text(dateUtils.dateFormat(transaction.transactionDate))
                    ],
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
