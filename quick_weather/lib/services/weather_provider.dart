import 'package:flutter/foundation.dart';
import 'package:quick_weather/models/weather_model.dart';
import '../services/weather_services.dart';

class WeatherProvider extends ChangeNotifier{
  final _services=WeatherServices();
  bool isLoading=false;
  WeatherModel weatherModel=WeatherModel();

  WeatherModel get getWeather =>weatherModel;

  ///provider is used to perform background processing data received form
  ///API and to avoid mixing of backend code with ui code._services object
  ///is used to get response from API.isLoading is a variable that keeps on
  ///rotating until app receives data.notifyListeners method notifies listener
  ///homepage when there is an update in any of the value in provide class.
  Future<void> getWeatherData(String location) async {
    isLoading=true;
    notifyListeners();
    final response= await _services.getAll(location) ;
    weatherModel=WeatherModel(weather:response!);
    isLoading=false;
    notifyListeners();

  }

}