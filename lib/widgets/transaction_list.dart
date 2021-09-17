import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses_app/models/transactionsl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deletetx;

  TransactionList(this.transactions,this.deletetx);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
       height:550,
        child: transactions.isEmpty ?Column(children: [
          Text('No Transactions Added Yet!'),
          Image.asset('images/notransaction.jpg')
        ],): ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.symmetric(
                      vertical:10,
                      horizontal:15
                    ) ,
                    decoration: BoxDecoration(
                       border: Border.all(
                  color: Colors.blue[500],
                  width: 2,
                  ),

                 ),
                  child: Padding(
                    padding: const EdgeInsets.all(9),
                    child: Center(
                     child: Text(
                          '₹${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[500],
                          ),
                        ),
                 ),
                  ),
                    ),
                    SizedBox(width: 10,),
                  Expanded(
                       child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.delete ,color: Colors.blue[500],),
                  iconSize: 30,
                  onPressed:() {deletetx(transactions[index].id);})
                ],
              ),
            );
            
         
          },
          itemCount: transactions.length,
        ),
      ),
    );
  }
}
