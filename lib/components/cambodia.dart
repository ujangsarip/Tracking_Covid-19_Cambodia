import 'package:flutter/material.dart';
import 'package:covid19/widgets/summary_card.dart';

class Cambodia extends StatelessWidget {
  final double height;
  final data;

  Cambodia(
      {this.height,
      this.data}); //When Component of Cambodia Used, will Recive The Data From HOME.DART

  @override
  Widget build(BuildContext context) {
    //Split for 2 Columns
    return Column(
      children: <Widget>[
        //Part one is HEADING
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          
          child: const Text(
            'Data Report In Cambodia',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          height: 100.0,
          width: 300.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQT3YcmTUIB9R3tmxROBhWe_CBA0YqCMLrJTmQOrPz-RQMNfnge&usqp=CAU")),
          ),
        ),
        Divider(),
        //This Part For His Data one by one
        Expanded(
          flex: 2,
          //Display Data by GRIDVIEW
          child: GridView.count(
            childAspectRatio: height / 350, //Height Ratio 350
            crossAxisCount: 2, //Just 2 Widget
            crossAxisSpacing: 15, //Distance
            mainAxisSpacing: 10,
            children: <Widget>[
              SummaryCard(
                total: data.summary.confirmed,
                label: 'Confirmed',
                color: Colors.yellowAccent,
                size: 35,
              ),
              SummaryCard(
                total: data.summary.activeCases,
                label: 'ActiveCases',
                color: Colors.blue[300],
                size: 35,
              ),
              SummaryCard(
                total: data.summary.recovered,
                label: 'Recovered',
                color: Colors.greenAccent,
                size: 35,
              ),
              SummaryCard(
                total: data.summary.deaths,
                label: 'Deaths',
                color: Colors.red[300],
                size: 35,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
