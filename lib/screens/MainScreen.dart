import 'package:flutter/material.dart';
import 'package:flutter_htpp_demo/data/api/category_api.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
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
      body: FutureBuilder(
        future: CategoryApi.getCategories(),
        builder: (context,snapshot){
          return snapshot.hasData ? Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*.1,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data["categories"].length,
                        itemBuilder:(context,index){
                      return getCategoryWidget(snapshot.data["categories"][index]);
                    }),
                  ),
                ]
            ),
          ):CircularProgressIndicator();
        },
      )
    );
  }

   getCategoryWidget(data) {
    //return TextButton(onPressed: () {}, child: Text(category.categoryName));
    return TextButton(
      onPressed: () {},
//       style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(borderRadius:BorderRadius.circular(15))),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)))),
      child: Text(
        data["categoryName"],
        style: TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
