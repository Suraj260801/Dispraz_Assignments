import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherServices {
  Future<Weather?> getAll(String location) async {

    //Create client object
    final client = http.Client();
     String url =
        'http://api.weatherstack.com/forecast?access_key=f610bf62d894f9a0e8b5bb2a0b008471&query=$location';

      //Parse string url to uri
      final Uri uri = Uri.parse(url);

      //Make the HTTP GET request
      final response = await client.get(uri);

      //Check if the response is successful
      if (response.statusCode == 200) {

        //Convert JSON data to Weather Object on different thread.
        final Weather data =
        await compute(weatherFromJson, response.body.toString());
        return data;
      }else{
        //If the response is not successful, throw an error
        throw Exception('Failed to load data');
      }


    return null;
  }
}
