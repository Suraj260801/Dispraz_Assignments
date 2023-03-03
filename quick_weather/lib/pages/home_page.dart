import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_weather/data/weather_database.dart';
import 'package:quick_weather/services/weather_provider.dart';
import 'package:quick_weather/utils/constants.dart';
import '../models/weather_model.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String updatedLocation = Constants.defaultLocation;
  late int index;
  final WeatherDatabase database = WeatherDatabase();
  final _myBox = Hive.box('locationList');
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() {
            isAlertSet = true;
          });
        }
      },
    );
  }

  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConnectivity();
    if (_myBox.get('WEATHER_LOCATION_LIST') == null) {
      database.initData();
    } else {
      database.loadData();
    }
    Provider.of<WeatherProvider>(context, listen: false)
        .getWeatherData(database.favoriteCity ?? Constants.defaultLocation);
  }

  Future<void> updateLocation(String location) async {
    Provider.of<WeatherProvider>(context, listen: false)
        .getWeatherData(location);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<WeatherProvider>(
          builder: (context, value, child) {
            String? weather =
                value.getWeather.weather?.current.weatherDescriptions[0];
            getWeatherIndex(weather);
            return RefreshIndicator(
              onRefresh: () async {
                updateLocation(database.favoriteCity ?? updatedLocation);
              },
              semanticsLabel: 'Refresh',
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: AnimatedSwitcher(
                          duration: const Duration(seconds: 4),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                          child: Image.asset(
                            Constants.images[index],
                            key: ValueKey(Constants.images[index]),
                            fit: BoxFit.fill,
                            width: double.maxFinite,
                            height: double.maxFinite,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (value.isLoading)
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () async {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback(
                                              (timeStamp) async {
                                        List<dynamic> location =
                                            await Navigator.pushNamed(
                                                    context, '/archives',
                                                    arguments: updatedLocation)
                                                as List<dynamic>;
                                        updatedLocation = location[0] as String;
                                        await updateLocation(updatedLocation);
                                      });
                                    },
                                    child: const Text(
                                      'Archives',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // const MenuItems(),
                          IconButton(
                              onPressed: () async {
                                Location? weatherLocation =
                                    value.weatherModel.weather?.location;
                                Current? weatherCurrent =
                                    value.weatherModel.weather?.current;
                                checkDuplicateLocatin(
                                    weatherLocation!, weatherCurrent!);
                                List<String> location =
                                    await Navigator.pushNamed(
                                            context, '/newLocation')
                                        as List<String>;
                                updatedLocation = location[0];
                                await updateLocation(location[0]);
                              },
                              icon: const Icon(Icons.location_pin)),
                          Text(
                            value.getWeather.weather?.location.name ?? "",
                            style: const TextStyle(fontSize: 50),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (index == 0 || index == 3)
                            Image.asset(
                              'assets/images/sun.png',
                              height: 80,
                            ),
                          Text(
                            '${value.getWeather.weather?.current.temperature.toString() ?? ""}°C',
                            style: const TextStyle(fontSize: 80),
                          ),
                          Text(
                              value.getWeather.weather?.current
                                      .weatherDescriptions[0] ??
                                  "",
                              style: const TextStyle(fontSize: 30)),

                          const SizedBox(height: 150,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Humidity:${value.getWeather.weather?.current.humidity.toString()??""}',style: const TextStyle(fontSize: 20),),
                              Text('Pressure:${value.getWeather.weather?.current.pressure.toString()??""}',style: const TextStyle(fontSize: 20)),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Uv Index:${value.getWeather.weather?.current.uvIndex.toString()??""}',style: const TextStyle(fontSize: 20),),
                              Text('Visibility:${value.getWeather.weather?.current.visibility.toString()??""}',style: const TextStyle(fontSize: 20)),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Feels Like:${value.getWeather.weather?.current.feelslike.toString()??""}',style: const TextStyle(fontSize: 20),),
                              Text('Time:${value.getWeather.weather?.current.observationTime.toString()??""}',style: const TextStyle(fontSize: 20)),

                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void getWeatherIndex(String? weather) {
    if (weather == 'Sunny') {
      index = 0;
    } else if (weather == 'Haze') {
      index = 1;
    } else if (weather == 'Cloudy') {
      index = 2;
    } else if (weather == 'Clear') {
      index = 3;
    } else if (weather == 'Mist') {
      index = 4;
    } else if (weather == 'Smoke') {
      index = 5;
    } else if (weather == 'Partly cloudy') {
      index = 6;
    } else {
      index = 7;
    }
  }

  void checkDuplicateLocatin(Location weatherLocation, Current weatherCurrent) {
    int flg = 0;
    for (int i = 0; i < database.weatherLocationList.length; i++) {
      if (database.weatherLocationList[i][0] == weatherLocation.name) {
        flg = 1;
      }
    }
    if (flg != 1) {
      database.weatherLocationList.add([
        weatherLocation.name,
        weatherCurrent.temperature.toString() ?? "",
        weatherCurrent.weatherDescriptions[0] ?? ""
      ]);
    }
    database.updateDataBase();
  }

  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('No Connection'),
              content: const Text('Please check your internet connection'),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    setState(() {
                      isAlertSet = false;
                    });
                    isDeviceConnected =
                        await InternetConnectionChecker().hasConnection;
                    if (!isDeviceConnected) {
                      showDialogBox();
                      setState(() {
                        isAlertSet = true;
                      });
                    }
                  },
                  child: const Text('OK'),
                )
              ]));
}
