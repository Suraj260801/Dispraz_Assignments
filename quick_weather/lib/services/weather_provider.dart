import 'package:flutter/foundation.dart';
import 'package:quick_weather/models/weather_model.dart';
import '../services/weather_services.dart';

class WeatherProvider extends ChangeNotifier{
  //Create an instance API
  final _services=WeatherServices();
  bool isLoading=false;
  WeatherModel weatherModel=WeatherModel();

  //Create the getter method to return response
  WeatherModel get getWeather =>weatherModel;

  //Create a function to return Weather data
  Future<void> getWeatherData(String location) async {
    isLoading=true;
    notifyListeners();

    //Fetch Weather data from API
    final response= await _services.getAll(location) ;
    weatherModel=WeatherModel(weather:response);
    isLoading=false;
    notifyListeners();

  }

}