enum Category{necklace , bracelet , other}


class Accessory{

  String id;
  String title;
  String description;
  double price;
  Category category;
  String imageURL;

  Accessory({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageURL
  });

}