import 'package:flutter/material.dart';
import 'package:personal_expenses/components/new_transaction.dart';
import 'package:uuid/uuid.dart';

import './chart.dart';
import './transaction_container.dart';
import '../model/transaction.dart';

class PersonalExpensesHomePage extends StatefulWidget {
  @override
  _PersonalExpensesHomePageState createState() =>
      _PersonalExpensesHomePageState();
}

class _PersonalExpensesHomePageState extends State<PersonalExpensesHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where(
      (transaction) {
        return transaction.transactionDate.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionContainer(
                transactions: this._transactions,
                onDelete: this._deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((item) => item.id == id);
    });
  }

  void _addNewTransaction(
    String title,
    double amount,
    DateTime transactionDate,
  ) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      transactionDate: transactionDate,
      id: Uuid().v1(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
      context: buildContext,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(this._addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
}
