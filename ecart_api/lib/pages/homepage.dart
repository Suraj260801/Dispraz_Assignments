import 'package:flutter/material.dart';
import '../services/products_provider.dart';
import 'package:provider/provider.dart';
import '../utils/productTile.dart';
import 'dart:async';
import 'package:flutter/services.dart';

//setState error
//
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const MethodChannel platform = MethodChannel('samples.flutter.dev/method_channel');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _openCamera() async {
    try {
      await platform.invokeMethod('openCamera');
    } on PlatformException catch (e) {
      print('Failed to open camera: ${e.message}');
    }
  }

  Future<void> showToast(String message) async {
    try {
      await platform.invokeMethod('showToast', {'message': message});
    } on PlatformException catch (e) {
      print("Failed to show toast: '${e.message}'.");
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getAllProducts();
  }

  ///openCamera is a native method call to open camera written in android because this support
  ///by default is not present in flutter.provider is used to separate computational code UI code.
  ///Listview is used to show received API response data on device in an interactive way.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: ,
        title: const Text('E Cart'),
        actions: [
          TextButton(
            onPressed: _getBatteryLevel,
            child: Text(
              _batteryLevel,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
            backgroundColor: Colors.white,
            child: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/icons/user.jpg'),
                  ),
                  ElevatedButton(
                      onPressed: _openCamera, child: const Text('Add Photo')),
                  ElevatedButton(
                      onPressed: ()=>showToast("I was sent from dart"),
                      child: const Text('Show Toast')
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).closeDrawer();
                        },
                        icon: const Icon(Icons.arrow_back));
                  })
                ],
              ),
            )),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 10,
                  thickness: 1,
                );
              },
              itemCount: value.productModel?.products.length ?? 0,
              itemBuilder: (context, index) {
                return ProductTile(
                    product: value.productModel!.products[index]);
              });
        },
      ),
    );
  }
}
