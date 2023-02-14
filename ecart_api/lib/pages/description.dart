import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/product_model.dart';

class Description extends StatelessWidget {
  const Description({super.key});
  ///MediaQuery computes the width and height of device on app is running and
  ///make application more responsive.arguments are received form homepage as
  ///an object of Product class.details screen is created to show list-item data
  ///in more detailed way.The product object contains all attributes of selected
  ///product including title,price rating etc.
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/image_view',arguments: [product.images[0],product.title]);
                },
                child: Hero(
                  tag: product.images[0],
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(product.images[0]),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15,),
            SizedBox(
              height: size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Rating:${product.rating}',
                        style: const TextStyle(fontSize: 30),
                      ),
                      const Icon(
                        Icons.star,
                        size: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Price:${product.price}',
                        style: const TextStyle(fontSize: 30),
                      ),
                      const Icon(Icons.currency_rupee)
                    ],
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 25,),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
