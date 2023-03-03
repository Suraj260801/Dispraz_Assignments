import 'package:hive/hive.dart';

class WeatherDatabase{
  List weatherLocationList=[];
  String ?favoriteCity;

  final _myBox=Hive.box('locationList');

  void initData(){
    weatherLocationList=[];
  }

  void loadData(){
    weatherLocationList=_myBox.get('WEATHER_LOCATION_LIST');
    favoriteCity=_myBox.get('favoriteCity');
  }

  void updateDataBase(){
    _myBox.put('WEATHER_LOCATION_LIST', weatherLocationList);
    _myBox.put('favoriteCity',favoriteCity);

  }

}
