import 'package:covid19/providers/world_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cambodia_model.dart';

class CoronaProvider with ChangeNotifier {
  CambodiaModel summary; // This State For store data in cambodia
  WorldModel world; // This State For store data in the world

  //This Function for get the data
  Future<void> getData() async {
    //let's get data form cambodia
    final url = 'https://floating-savannah-17132.herokuapp.com/data';
    final response = await http.get(url);

    //convert data
    final result = json.decode(response.body) as Map<String, dynamic>;
    // Store Data to state Summary by CambodiaModel
    summary = CambodiaModel(
      confirmed: result['confirmed'],
      recovered: result['recovered'],
      deaths: result['deaths'],
      activeCases: result['activeCases'],
    );

    //For Data Covid-19 Global we have 3 APIs. Let's look...

    final worldPositive =
        'https://evening-peak-53878.herokuapp.com/api/v1/positif';
    final responsePositive = await http.get(worldPositive);
    final resultPositive = json.decode(responsePositive.body);

    final worldRecovered =
        'https://evening-peak-53878.herokuapp.com/api/v1/sembuh';
    final responseRecovered = await http.get(worldRecovered);
    final resultRecovered = json.decode(responseRecovered.body);

    final worldDeaths =
        'https://evening-peak-53878.herokuapp.com/api/v1/meninggal';
    final responseDeaths = await http.get(worldDeaths);
    final resultDeaths = json.decode(responseDeaths.body);

    world = WorldModel(
        confirmed: resultPositive['value'],
        deaths: resultDeaths['value'],
        recovered: resultRecovered['value']);
    notifyListeners(); //Information for update State
  }
}
