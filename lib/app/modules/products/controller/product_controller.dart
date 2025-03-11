import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/repository/product_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin {
  final ProductDataSource _productDataSource;

  ProductController(this._productDataSource);

  List<Data> products=<Data>[];

  getProducts() async {
    change(null, status: RxStatus.loading());
    products = await _productDataSource.getProducts('/products?page=1') ?? [];
    print(products);
    change(null, status: RxStatus.success());
  }

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.phone_iphone, "name": "Mobiles"},
    {"icon": Icons.laptop_mac, "name": "Laptops"},
    {"icon": Icons.tv, "name": "TVs"},
    {"icon": Icons.headphones, "name": "Headphones"},
    {"icon": Icons.watch, "name": "Watches"},
    {"icon": Icons.tv, "name": "TVs"},
    {"icon": Icons.headphones, "name": "Headphones"},
    {"icon": Icons.watch, "name": "Watches"},
  ];

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
