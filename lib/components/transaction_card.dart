import 'package:flutter/material.dart';
import 'package:personal_expenses/model/transaction.dart';
import '../utils/datetime/date_utils.dart' as dateUtils;

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard({
    @required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.all(10),
          ),
          Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Text(
                  transaction.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateUtils.dateFormat(transaction.transactionDate),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          )
        ],
      ),
    );
  }
}
