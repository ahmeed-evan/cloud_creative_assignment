class Product {
  String? status;
  List<Data>? data;

  Product({this.status, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? title;
  String? image;
  int? price;
  String? description;
  String? brand;
  String? model;
  String? color;
  String? category;
  int? discount;
  bool? popular;
  bool? onSale;

  Data(
      {this.id,
        this.title,
        this.image,
        this.price,
        this.description,
        this.brand,
        this.model,
        this.color,
        this.category,
        this.discount,
        this.popular,
        this.onSale});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    brand = json['brand'];
    model = json['model'];
    color = json['color'];
    category = json['category'];
    discount = json['discount'];
    popular = json['popular'];
    onSale = json['onSale'];
  }
}
