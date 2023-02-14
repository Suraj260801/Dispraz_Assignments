import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductsServices {
  Future<ProductModel?> getAll() async {
    final client = http.Client();
    const String url = 'https://dummyjson.com/products';
    final Uri uri = Uri.parse(url);
    final response = await client.get(uri);

    ///get method of Client accepts uri hence it is parsed from string to uri using parse method of Uri class.
    ///statusCode 200 indicates that everything is ok and response is received successfully.If the statusCode is
    ///other than 200 we return null.
    ///The compute method is used to create another thread responsible for json parsing which is a
    ///synchronous work can affect performance of the application.
    if (response.statusCode == 200) {
      final ProductModel data =
          await compute(productModelFromJson, response.body.toString());
      return data;
    }
    return null;
  }
}
