import 'package:ecommerce_app_cloud_creative/app/global/widgets/cusom_appbar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy Categories
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

    // Dummy Product Data
    final List<Map<String, dynamic>> products = [
      {
        "image": "https://via.placeholder.com/150",
        "title": "iPhone 14",
        "price": "\$999"
      },
      {
        "image": "https://via.placeholder.com/150",
        "title": "MacBook Pro",
        "price": "\$1999"
      },
      {
        "image": "https://via.placeholder.com/150",
        "title": "Samsung TV",
        "price": "\$599"
      },
      {
        "image": "https://via.placeholder.com/150",
        "title": "Sony Headphones",
        "price": "\$299"
      },
      {
        "image": "https://via.placeholder.com/150",
        "title": "Apple Watch",
        "price": "\$399"
      },
      {
        "image": "https://via.placeholder.com/150",
        "title": "iPad Air",
        "price": "\$699"
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: "Home"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Category Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Categories",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("View More"))
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(category["icon"],
                            size: 30, color: Colors.blue),
                      ),
                      const SizedBox(height: 5),
                      Text(category["name"],
                          style: const TextStyle(fontSize: 12))
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Product Section Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Top Products",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 10),

            // 🔹 Product Grid
            Expanded(
              child: GridView.builder(
                itemCount: products.length + 1, // +1 for "View More"
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Aspect ratio for better layout
                ),
                itemBuilder: (context, index) {
                  if (index == products.length) {
                    return Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("View More",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    );
                  }
                  final product = products[index];
                  return _buildProductCard(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Product Card Widget
  Widget _buildProductCard(Map<String, dynamic> product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            // Expanded(
            //   child: Image.network(product["image"], width: double.infinity, fit: BoxFit.cover),
            // ),
            Icon(Icons.print),
            const SizedBox(height: 8),

            // Product Title
            Text(product["title"],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),

            const SizedBox(height: 5),

            // Product Price
            Text(product["price"],
                style: const TextStyle(fontSize: 14, color: Colors.green)),

            const SizedBox(height: 8),

            // Wishlist & Add to Cart Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
