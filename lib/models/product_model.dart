class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  ProductModel(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);
  ProductModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromjson(json['rating']) : null;
  }
}

class Rating {
  num? rate;
  int? count;
  Rating(this.rate, this.count);
  Rating.fromjson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
