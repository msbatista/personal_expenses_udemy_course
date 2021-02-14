import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_card.dart';

class TransactionContainer extends StatelessWidget {
  final List<Transaction> transactions;
  final Function onDelete;

  TransactionContainer({
    @required this.transactions,
    @required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionCard(
                    transaction: transactions[index], onDelete: this.onDelete);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
