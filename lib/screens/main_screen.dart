import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_htpp_demo/data/api/category_api.dart';
import 'package:flutter_htpp_demo/data/api/product_api.dart';
import 'package:flutter_htpp_demo/models/category.dart';
import 'package:flutter_htpp_demo/models/product.dart';
import 'package:flutter_htpp_demo/screens/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var categories = <Category>[];
  var categoryWidgets = <Widget>[];
  var products = <Product>[];

  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: categoryWidgets),
            ),
            ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        print(list);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (var category in categories) {
      categoryWidgets.add(getCategoryWidget(category));
    }

    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    var categoryFlatButton = Container(
      margin: EdgeInsets.only(right: 10),
      child: OutlinedButton(
          onPressed: () {
            getProductsById(category);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Text(
              category.categoryName,
              style: TextStyle(color: Colors.blueGrey),
            ),
          )),
    );

    return categoryFlatButton;
  }


    void getProductsById(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response){
      setState(() {
       Iterable list=json.decode(response.body);
       this.products=list.map((e) => Product.fromJson(e)).toList();
       
      });
    });
  }

  }

