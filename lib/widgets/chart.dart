import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_app/models/transactionsl.dart';
import 'package:expenses_app/widgets/chartbar.dart';


class Chart extends StatelessWidget {
 final List<Transactions> recenttransactions;

  Chart(this.recenttransactions);

 List<Map<String,Object>>  get groupedTransaction{
 
 return List.generate(7, (index) {
  
  final weekDay =DateTime.now().subtract(Duration(days: index));
 
  var totalamount=0.0;
  


  for (var i =0;i< recenttransactions.length;i++){
   if(recenttransactions[i].date.day==weekDay.day
   && recenttransactions[i].date.month==weekDay.month
   && recenttransactions[i].date.year==weekDay.year)
    { totalamount += recenttransactions[i].amount;}

  
  }




   return {'day':DateFormat.E().format(weekDay).substring(0,1),
   'amount': totalamount };

 }).reversed.toList(); //reverses the order of list
 }
  double get totalspending{
    return groupedTransaction.fold(0.0, (sum,item) {
      return sum+ item['amount'];
  });
  }
  @override
  Widget build(BuildContext context) {
  
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
          groupedTransaction.map((data){
            //return Text('${data['day']}: ${data['amount']}');
            return Flexible(
              fit:FlexFit.tight,
                        child: ChartBar(data['day'], data['amount'], 
              totalspending==0.0 ? 0.0 : (data['amount']as double)/totalspending), //ata['amount']as double) object se divide nhi kar sakte hai isliye as double  
            );
    }).toList()
        ),
      ),
    );
  }
}