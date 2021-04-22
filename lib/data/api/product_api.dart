import 'dart:convert';

import 'package:http/http.dart' as http;

  String apiUrl="http://10.0.2.2:3000";
class ProductApi {
  
  static Future getProducts()=>
  http.get(Uri.parse(apiUrl+"/products"));

  static Future getProductsByCategoryId(int categoryId)=>
  http.get(Uri.parse(apiUrl+"/products?categoryId=$categoryId"));
  
}
