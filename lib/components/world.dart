import 'package:flutter/material.dart';
import 'package:covid19/widgets/summary_card.dart';

class World extends StatelessWidget {
  final double height;
  final data;

  World({this.height, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 5),
          child: const Text(
            'World Data Report',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: height / 430,
            children: <Widget>[
              SummaryCard(
                total: data.world.confirmed,
                label: 'Confirmed',
                color: Colors.yellowAccent,
                size: 20,
              ),
              SummaryCard(
                total: data.world.recovered,
                label: 'Recovered',
                color: Colors.greenAccent,
                size: 20,
              ),
              SummaryCard(
                total: data.world.deaths,
                label: 'Deaths',
                color: Colors.red[300],
                size: 20,
              ),
            ],
          ),
        ),
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "http://www.npic.edu.kh/wp-content/uploads/2019/06/cropped-NPIC_Logo_Khmer.png")),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          "NATIONAL POLYTECHNIC INSTITUTE OF CAMBODIA",
          style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
