import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_card.dart';

class TransactionContainer extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionContainer({
    @required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map(
            (transaction) {
              return TransactionCard(
                transaction: transaction,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
