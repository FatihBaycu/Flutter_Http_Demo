class Product{

  int id;
  int categoryId;
  String productName;
  double quantityPerUnit;
  double unitPrice;
  int unitsInStock;

  Product(this.id,this.categoryId,this.productName,this.quantityPerUnit,this.unitPrice,this.unitsInStock);

  Product.fromJson(Map json){
    this.id=int.tryParse(json["id"].toString());
    this.categoryId=int.tryParse(json["categoryId"].toString());
    this.productName=json["productName"];
    this.quantityPerUnit=double.tryParse(json["quantityPerUnit"].toString());
    this.unitPrice=double.tryParse(json["unitPrice"].toString());
    this.unitsInStock=int.tryParse(json["unitsInStock"].toString());
  }


  Map toJson(){
    Map productJsonFormat={
      "id":this.id,
      "categoryId":this.categoryId,
      "productName":this.productName,
      "quantityPerUnit":this.quantityPerUnit,
      "unitPrice":this.unitPrice,
      "unitsInStock":this.unitsInStock

    };
    return productJsonFormat;
  }

}