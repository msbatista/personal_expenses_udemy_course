import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_card.dart';

class TransactionContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionContainerState();
  }
}

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

class _TransactionContainerState extends State<TransactionContainer> {
  final List<Transaction> transactions = _getTransactions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map(
        (transaction) {
          return TransactionCard(
            transaction: transaction,
          );
        },
      ).toList(),
    );
  }
}
