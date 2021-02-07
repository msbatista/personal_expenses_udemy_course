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
      height: 295,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionCard(
            transaction: transactions[index],
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
