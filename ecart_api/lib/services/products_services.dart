import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductsServices {
  Future<ProductModel?> getAll() async {
    final client = http.Client();
    const String url = 'https://dummyjson.com/products';
    final Uri uri = Uri.parse(url);

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final ProductModel data =
          await compute(productModelFromJson, response.body.toString());
      return data;
    }
    return null;
  }
}
