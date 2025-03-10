import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Product Image
            Center(
              child: Image.network(product.image, height: 250, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),

            // 🔹 Product Title
            Text(product.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            const SizedBox(height: 8),

            // 🔹 Price
            Text("\$${product.price}", style: const TextStyle(fontSize: 18, color: Colors.green)),

            const SizedBox(height: 16),

            // 🔹 Description
            Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.grey)),

            const SizedBox(height: 16),

            // 🔹 Wishlist & Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red, size: 30),
                  onPressed: () {
                    // TODO: Add to wishlist logic
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add to cart logic
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
