import 'package:covid19/providers/corona_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/cambodia.dart';
import 'components/world.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height; //Resize Layout

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Cambodia Covid-19'),
      ),

      //For Load Data last Updated
      body: RefreshIndicator(
        //Using Attribute onRefresh
        //Get Data by CoronaProvider
        onRefresh: () =>
            Provider.of<CoronaProvider>(context, listen: false).getData(),
        child: Container(
          margin: const EdgeInsets.all(20),
          //When Apps opened, that's will work function FutureBuilder
          child: FutureBuilder(
            //Load data Using Same Method
            future:
                Provider.of<CoronaProvider>(context, listen: false).getData(),
            builder: (context, snapshot) {
              //Still Loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                //Dispaly Loading Indicator
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              //We Are Using CONSUMER For Get Data By CORONA PROVIDER
              return Consumer<CoronaProvider>(
                builder: (context, data, _) {
                  //Have 2  COLUMNS
                  return Column(
                    children: <Widget>[
                      //The First Data Of Cambodia
                      Flexible(
                        flex: 1,
                        child: Cambodia(
                          height: height,
                          data: data,
                        ),
                      ),
                      //Second Data Global
                      Flexible(
                        flex: 1,
                        child: World(
                          height: height,
                          data: data,
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
