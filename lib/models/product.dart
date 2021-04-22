class Product {
  int id;
  int categoryId;
  String productName;
  double quantityPerUnit;
  double unitPrice;
  int unitsInStock;

  Product.withId({id,categoryId,productName,quantityPerUnit,unitPrice,unitsInStock});
  Product({categoryId,productName,quantityPerUnit,unitPrice,unitsInStock});

   Product.fromJson(Map json){
    id=int.tryParse(json[id].toString());
    categoryId=json[categoryId];
    productName=json[productName];
    quantityPerUnit=json[quantityPerUnit];
    unitPrice=double.tryParse(json[unitPrice].toString());
    unitsInStock=json[unitsInStock];
  }

    Map toJson(){     
     Map productJsonFormat={
      "id":id,
      "categoryId":categoryId,
      "productName":productName,
      "quantityPerUnit":quantityPerUnit,
      "unitPrice":unitPrice,
      "unitsInStock":unitsInStock,
    };

    return productJsonFormat;}
    
    
}
