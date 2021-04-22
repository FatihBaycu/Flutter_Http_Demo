import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_htpp_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;
  ProductListRowWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child:Card(
        child: Column(
          children: [
            Container(
              child: Image.network("https://i.pinimg.com/736x/0e/35/8d/0e358d98578648662715198235ce64ee.jpg"),
                      height: 130.0, width: MediaQuery.of(context).size.width*2,
            ),
            Text(product.productName),
            Text(product.unitPrice.toString()+" TL",style:TextStyle(fontSize: 18.0,color:Colors.grey)),
          ],
        ),
      ),
    );
  }
}
