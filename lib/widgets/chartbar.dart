import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
 final String label;
 final double spendingAmount;
 final double spendingPctOfTotal;
 ChartBar( this.label,this.spendingAmount,this.spendingPctOfTotal);

 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:15 ,
          child: FittedBox(child: Text('₹ ${spendingAmount.toStringAsFixed(0)}'))),// text ka size will always be 15
        SizedBox(height:4),
        Container(
          height: 85, //height n width of bar
          width: 18,
          child: Stack(  // ek ke uper ek widget dal na
           alignment:Alignment.bottomCenter,children:[
              Container(
                decoration:BoxDecoration(
                  border:Border.all(color:Colors.blue[300],width: 1.0),
                  color:Colors.blue[100],
                  borderRadius:BorderRadius.vertical(),
                )
              ),
              FractionallySizedBox(heightFactor:spendingPctOfTotal,
              child:Container(
                decoration:BoxDecoration(color:Theme.of(context).primaryColor,
                 borderRadius:BorderRadius.vertical()
                 )

              ))

            ],
          ),
        ),
        
        SizedBox(height:4),
        Text(label)
      ],
      
    );
  }
}