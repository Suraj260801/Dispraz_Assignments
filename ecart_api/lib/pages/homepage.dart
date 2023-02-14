import 'package:flutter/material.dart';
import '../services/products_provider.dart';
import 'package:provider/provider.dart';
import '../utils/productTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        automaticallyImplyLeading: false,
        title: const Text('App Store'),
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
