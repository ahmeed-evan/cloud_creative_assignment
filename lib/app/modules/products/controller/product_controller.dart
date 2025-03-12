import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/repository/product_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin {
  final ProductDataSource _productDataSource;

  ProductController(this._productDataSource);

  RxList<Data> products = <Data>[].obs;
  RxBool isLoadingMore = false.obs;
  int currentPage = 1;

  // 🔹 Initial Data Load
  void getProducts() async {
    change(null, status: RxStatus.loading());
    final newProducts =
    await _productDataSource.getProducts('/products?page=$currentPage');
    if (newProducts != null && newProducts.isNotEmpty) {
      products.addAll(newProducts);
    }
    change(null, status: RxStatus.success());
  }

  // 🔹 Load More Data when scrolling to the bottom
  Future<void> loadMoreProducts() async {
    if (isLoadingMore.value) return; // Prevent duplicate calls

    isLoadingMore.value = true;
    currentPage++;

    final newProducts =
    await _productDataSource.getProducts('/products?page=$currentPage');
    if (newProducts != null && newProducts.isNotEmpty) {
      products.addAll(newProducts);
    }

    isLoadingMore.value = false;
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
