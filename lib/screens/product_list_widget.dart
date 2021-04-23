import 'package:flutter/material.dart';
import 'package:flutter_htpp_demo/models/product.dart';
import 'package:flutter_htpp_demo/screens/product_list_row_widget.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = <Product>[];

  ProductListWidget(this.products);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    var productListView = Column(
      children: [
        SizedBox(
          height: 10),
        SizedBox(
          height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ))
   ],
    );
   return productListView;

  }
}
