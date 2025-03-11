import 'package:ecommerce_app_cloud_creative/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends GetView<WishListController> {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("My Wishlist")),
        body: Obx(
          () => controller.wishListProducts.isEmpty
              ? const Center(
                  child: Text("Your wishlist is empty!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                )
              : ListView.builder(
                  itemCount: controller.wishListProducts.length,
                  itemBuilder: (context, index) {
                    final item = controller.wishListProducts[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: ListTile(
                        leading: Image.network(item.image ?? '',
                            width: 60, height: 60, fit: BoxFit.cover),
                        title: Text(item.title ?? '',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(item.price.toString(),
                            style: const TextStyle(color: Colors.green)),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                controller.addOrRemoveToWishList(item)),
                      ),
                    );
                  },
                ),
        ));
  }
}
