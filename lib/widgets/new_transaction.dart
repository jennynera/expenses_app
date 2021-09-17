import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selecteddate;

  void submitData() {
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 ||selecteddate==null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      selecteddate,
    );
    Navigator.of(context).pop();
  }
  void presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(),
     firstDate: DateTime(2021), 
     lastDate:DateTime.now()
    ).then((pickedDate){
     if(pickedDate==null){return; }
     setState(() {
       selecteddate=pickedDate;
     });
     


    })
    ;}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child:SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              
                  TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
              
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(child: Text(selecteddate==null ? 'No Date Chossen':'Picked Date: ${DateFormat.yMd().format(selecteddate)}')),
                    TextButton(
                      onPressed:presentDatePicker ,
                      child:  Text('Choose Date',style: TextStyle(color:Colors.blue),
                    
                    ))
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                style:ElevatedButton.styleFrom(primary:Colors.blue,
              ), onPressed: submitData,),


            ],
          ),
        ),
      ),
    );
  }
}
