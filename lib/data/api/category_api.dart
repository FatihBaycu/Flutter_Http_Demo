import 'package:http/http.dart' as http;
class CategoryApi{

   static Future getCategories() async{
       
        var response=await http.get(Uri.http("10.0.2.2:3000","/categories"));
        print(response.body);
      return response;
  }
}