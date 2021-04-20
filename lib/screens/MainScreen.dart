import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_htpp_demo/data/api/category_api.dart';
import 'package:flutter_htpp_demo/models/category.dart';
import 'package:flutter_htpp_demo/models/product.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> categories;
  List<TextButton> categoryWidgets;
  List<Product> products;
  @override
  void initState() {
    getCategoriesFromApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Sistemi", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
                //children: categoryWidgets == null ? throw("Hata...") : categoryWidgets,
              ),
            ),
          ]
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((value) {
      setState(() {
        Iterable list = json.decode(value.body);
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
     });
    });
  }

  List<Widget> getCategoryWidgets() {
    if(categoryWidgets.length > 0){ 
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    if(categoryWidgets.length > 0){ return categoryWidgets; }
   // return categoryWidgets;
    }
  }

   getCategoryWidget(Category category) {
    return TextButton(onPressed: () {}, child: Text(category.categoryName));
    // return TextButton(
    //   onPressed: () {},
    //    style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(borderRadius:BorderRadius.circular(15))),
    //   style: ButtonStyle(
    //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //           RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(18.0),
    //               side: BorderSide(color: Colors.red)))),
    //   child: Text(
    //     category.categoryName,
    //     style: TextStyle(color: Colors.blueGrey),
    //   ),
    // );
  }
}
