import 'package:ecommerce_app_cloud_creative/app/modules/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../products/models/product.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Obx(
        () => Column(
          children: [
            // Cart Item List
            Expanded(
              child: controller.cartProductsList.isEmpty
                  ? const Center(child: Text("Your cart is empty"))
                  : ListView.builder(
                      itemCount: controller.cartProductsList.length,
                      itemBuilder: (context, index) {
                        final item = controller.cartProductsList[index];
                        return _buildCartItem(item, index);
                      },
                    ),
            ),

            // Cart Summary & Checkout
            if (controller.cartProductsList.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Total Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("\$${controller.totalPrice.value}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Checkout Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Proceeding to order...")),
                          );
                        },
                        child: const Text("Proceed to Order"),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 🔹 Cart Item Widget
  Widget _buildCartItem(Data item, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Image.network(item.image ?? '',
            width: 60, height: 60, fit: BoxFit.cover),
        title: Text(item.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("\$${item.price}",
            style: const TextStyle(color: Colors.green)),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => controller.addOrRemoveToCart(item),
        ),
      ),
    );
  }
}
