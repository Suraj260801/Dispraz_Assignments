import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class NewLocation extends StatelessWidget {
  // Create a controller for the location input field
  TextEditingController locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //Create a regular expression for TextFormField validation
  final alphanumeric = RegExp(r'[0-9A-Z" "]+$');
  NewLocation({Key? key}) : super(key: key);

  bool validate() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back_sharp)),
                  Container(
                    width: MediaQuery.of(context).size.width*0.85,
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
                            if (value!.isEmpty||value==null) {
                              return "Required";
                            } else if (alphanumeric.hasMatch(value)) {
                              return "Invalid city name";
                            }
                            return null;
                          },
                        )),
                  ),
                ],
              ),

              ElevatedButton(
                  onPressed: () {
                    if(validate()){
                      Navigator.pop(context, [locationController.text.toString()]);
                    }
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
      log('hi');
      log(e.toString());
    }
    return "";
  }
}
