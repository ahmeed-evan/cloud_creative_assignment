import 'package:ecommerce_app_cloud_creative/app/modules/cart/controller/cart_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Data product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? '')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Product Image
            Center(
              child: Image.network(product.image ?? '',
                  height: 250, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),

            // 🔹 Product Title
            Text(product.title ?? '',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            const SizedBox(height: 8),

            // 🔹 Price
            Text("\$${product.price}",
                style: const TextStyle(fontSize: 18, color: Colors.green)),

            const SizedBox(height: 16),

            // 🔹 Description
            Text(product.description ?? '',
                style: const TextStyle(fontSize: 16, color: Colors.grey)),

            const SizedBox(height: 16),

            // 🔹 Wishlist & Add to Cart
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Get.find<WishListController>()
                        .wishListProducts
                        .contains(product)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border,
                        color: Colors.red),
                    onPressed: () => Get.find<WishListController>()
                        .addOrRemoveToWishList(product),
                  ),
                  ElevatedButton(
                    onPressed: () =>Get.find<CartController>().addOrRemoveToCart(product),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                    child: Text(Get.find<CartController>()
                        .cartProductsList
                        .contains(product)
                        ? "Remove"
                        : "Add"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
