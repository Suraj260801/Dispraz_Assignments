
import 'package:flutter/material.dart';
import 'package:quick_weather/data/weather_database.dart';
import 'package:hive/hive.dart';
class Archives extends StatefulWidget {
  const Archives({Key? key}) : super(key: key);

  @override
  State<Archives> createState() => _FavoritesState();
}

class _FavoritesState extends State<Archives> {
  WeatherDatabase database = WeatherDatabase();
  final _myBox=Hive.box('locationList');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(_myBox.get('WEATHER_LOCATION_LIST')==null){
      database.initData();
    }else{
      database.loadData();
    }

  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    String homeScreenLocation=ModalRoute.of(context)!.settings.arguments as String;
    print(homeScreenLocation);
    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              alignment: Alignment.topLeft,
                onPressed:(){
                    Navigator.pop(context,[homeScreenLocation]);
                },
                icon: const Icon(Icons.arrow_back_sharp)
            )
          ],
          title: const Text('Your Searched Locations'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: (){
                  database.favoriteCity=database.weatherLocationList[index][0];
                  database.updateDataBase();
                },
                onTap: (){
                  Navigator.pop(context,[database.weatherLocationList[index][0]]);
                },
                child: ListTile(
                  leading: SizedBox(
                    width: size.width*0.3,
                      child: Text(database.weatherLocationList[index][0])),
                  title: SizedBox(
                    width: size.width*0.2,
                    child: Text('${database.weatherLocationList[index][1]}°C'),
                  ),
                  trailing: Text(database.weatherLocationList[index][2]),

                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: database.weatherLocationList.length
        )
    );
  }
}

