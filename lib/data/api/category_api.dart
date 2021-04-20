import 'package:http/http.dart' as http;
class CategoryApi{

   static Future<http.Response>getCategories() {
        return http.get(Uri.http("10.0.2.2:3000","/categories"));

  }



  
}