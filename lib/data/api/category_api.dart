import 'dart:convert';

import 'package:http/http.dart' as http;
class CategoryApi{

   static Future getCategories() async{
       
        var response=await http.get(Uri.parse("https://run.mocky.io/v3/16ded805-2d03-45b8-968b-d77eaf5a3d68"));
        print(response.body);
      return jsonDecode(response.body);
  }
}