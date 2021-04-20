import 'package:http/http.dart' as http;
class CategoryApi{

   static Future getCategories() {
       
        var response=http.get(Uri.http("10.0.2.2:3000","/categories"));
        print("Çalışıyor $response");
      return  response;
  }
}