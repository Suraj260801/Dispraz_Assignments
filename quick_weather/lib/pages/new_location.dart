import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class NewLocation extends StatelessWidget {
  TextEditingController locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  NewLocation({Key? key}) : super(key: key);
  void validate(){
    if(_formKey.currentState!.validate()){
      log('Ok');
    }else{
      log('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Add city name',

                  ),
                  controller: locationController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Required";
                    }else if(value.length<2){
                      return "Invalid city name";
                    }
                  },
                )),
          ),
          ElevatedButton(
              onPressed: () {
                validate();
                Navigator.pop(context,[locationController.text.toString()]);
              },
              child: const Text('Search')
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.grey.shade300),
                ),
                onPressed: () async {
                  await Geolocator.requestPermission();
                  var position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.best)
                      .timeout(const Duration(seconds: 5));
                  String cityName =
                      await getCityName(position.latitude, position.longitude);
                  Navigator.pop(context, [cityName]);
                },
                child: const Text(
                  'Use my current location',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      )),
    );
  }

  Future<String> getCityName(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark placemark = placemarks[0];
      String cityName = placemark.locality!;
      return cityName;
    } catch (e) {
      log(e.toString());
    }
    return "";
  }
}
