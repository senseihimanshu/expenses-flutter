import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
     Transaction(id: '1', title: 'New Shoes', amount: 2.00, date: DateTime.now()),
     Transaction(id: '2', title: 'Watch', amount: 4.00, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount){
    final newTx = Transaction(title: title, amount: amount, id: DateTime.now().toString(), date: DateTime.now());

    setState(() {
      this._userTransactions.add(newTx);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(this._addNewTransaction),
        TransactionList(this._userTransactions),
      ],
    );
  }
}