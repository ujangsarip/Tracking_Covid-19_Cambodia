import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String total;
  final String label;
  final Color color;
  final int size;

  //HANDLE DATA Sending
  SummaryCard(
      {@required this.total,
      @required this.label,
      @required this.color,
      @required this.size});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //TOTAL DATA
          Text(
            total,
            style: TextStyle(
              fontSize: size.toDouble(),
              fontWeight: FontWeight.bold,
            ),
          ),
          //LABEL DATA
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
      elevation: 5,
    );
  }
}
