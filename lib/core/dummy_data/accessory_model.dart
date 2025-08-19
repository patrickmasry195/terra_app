import 'accessory.dart';

class AccessoryModel extends Accessory {
  AccessoryModel({
    required super.id,
    required super.title, 
    required super.description,
    required super.price,
    required super.category, 
    required super.imageURL
  });

  factory AccessoryModel.fromJson(Map<String ,dynamic> json){
    return AccessoryModel(
      id: json["id"], 
      title: json["title"], 
      description: json["description"], 
      price: json["price"], 
      category: json["category"],
      imageURL: json["imageURL"]
    );
  }

  Map<String , dynamic> toJson() => {
    "id": id,
    "title":title,
    "description":description,
    "price":price,
    "category":category,
    "imageURL" : imageURL
  };


  factory AccessoryModel.fromEntity(Accessory accessory){
    return AccessoryModel(
      id: accessory.id, 
      title:accessory.title, 
      description: accessory.description, 
      price: accessory.price, 
      category: accessory.category, 
      imageURL: accessory.imageURL
    );
  }

  Accessory toEntity() => Accessory(
    id: id,
    title: title,
    description: description,
    price: price,
    category: category,
    imageURL:imageURL
  );
}