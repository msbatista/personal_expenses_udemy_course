import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_container.dart';
import './new_transaction.dart';

List<Transaction> _getTransactions() => [
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
      ),
    ];

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final _transactions = _getTransactions();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionContainer(
          transactions: this._transactions,
        )
      ],
    );
  }
}
