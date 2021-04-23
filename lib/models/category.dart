class Category{
  int id;
  String categoryName;
  String seoUrl;

  Category.withId(this.id,this.categoryName,this.seoUrl);
  Category(this.categoryName,this.seoUrl);

  Category.fromJson(Map json){
    id=json["id"];
    categoryName=json["categoryName"];
    seoUrl=json["seoUrl"];
  }

    Map toJson(){
      Map categoryJsonFormat={
      "id":id,
      "categoryName":categoryName,
      "seoUrl":seoUrl
      }; 
      return categoryJsonFormat;
    }
    
}