import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
         Navigator.pushNamed(context, '/description',arguments: product);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: size.width * 0.2,
                child: Image(
                    height: 100,
                    fit: BoxFit.fill,
                    image: NetworkImage(product.images[0]))),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(product.title),
                  Row(
                    children: [
                      Text('${product.rating}',),
                      const Icon(Icons.star,size: 15,)
                    ],
                  ),
                  Text(
                    product.description,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'SourceSerif'
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: size.width * 0.2,
                child: Row(
                  children: [
                    const Icon(Icons.currency_rupee,size: 15,),
                    Text("${product.price} "),

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
