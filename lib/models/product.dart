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
    id=json[id];
    categoryId=json[categoryId];
    productName=json[productName];
    quantityPerUnit=json[quantityPerUnit];
    unitPrice=json[unitPrice];
    unitsInStock=json[unitsInStock];
  }

    Map toJson()=>{"id":id,"categoryId":categoryId,
    "productName":productName,"quantityPerUnit":quantityPerUnit,
      "unitPrice":unitPrice,"unitsInStock":unitsInStock
    };
    
    
}
