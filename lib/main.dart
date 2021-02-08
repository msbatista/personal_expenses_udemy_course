import 'package:flutter/material.dart';
import 'package:personal_expenses/components/new_transaction.dart';
import 'package:uuid/uuid.dart';
import './components/transaction_container.dart';
import './components/chart.dart';
import './model/transaction.dart';

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

class PersonalExpensesHomePage extends StatefulWidget {
  @override
  _PersonalExpensesHomePageState createState() =>
      _PersonalExpensesHomePageState();
}

class _PersonalExpensesHomePageState extends State<PersonalExpensesHomePage> {
  final _transactions = _getTransactions();

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      transactionDate: DateTime.now(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
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
            Chart(),
            TransactionContainer(transactions: this._transactions),
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
