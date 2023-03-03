import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherServices {
  Future<Weather?> getAll(String location) async {
    final client = http.Client();
    log(location);
     String url =
        'http://api.weatherstack.com/forecast?access_key=f610bf62d894f9a0e8b5bb2a0b008471&query=$location';

    final Uri uri = Uri.parse(url);


    ///get method of Client accepts uri hence it is parsed from string to uri using parse method of Uri class.
    ///statusCode 200 indicates that everything is ok and response is received successfully.If the statusCode is
    ///other than 200 we return null.
    ///The compute method is used to create another thread responsible for json parsing which is a
    ///synchronous work can affect performance of the application.
    try{
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final Weather data =
        await compute(weatherFromJson, response.body.toString());
        return data;
      }
    }catch(e){
      log(e.toString());
    }

    return null;
  }
}
