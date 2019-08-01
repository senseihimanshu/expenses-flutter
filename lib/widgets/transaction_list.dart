import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  // final Function _delete

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 550,
        child: this.transactions.isEmpty ? Column(
          children: <Widget>[
            Text(
              'No Transactions added yet!',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 400,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ) : 
        ListView.builder(
          itemBuilder: (ctx, index){
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          child: ListTile(
                leading: CircleAvatar(radius: 30, 
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FittedBox(child: Text('\$${transactions[index].amount}')),
                  ),
                ),
                title: Text(
                  transactions[index].title, 
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete), 
                  color: Theme.of(context).errorColor,
                  onPressed: (){},
                ),
              ),
            );
          },
          itemCount: transactions.length,
        )  
      );
  }
}
