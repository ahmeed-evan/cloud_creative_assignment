import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // 🔹 Dummy Wishlist Items
  List<Map<String, dynamic>> wishlistItems = [
    {"image": "https://via.placeholder.com/150", "title": "iPhone 14", "price": "\$999"},
    {"image": "https://via.placeholder.com/150", "title": "MacBook Pro", "price": "\$1999"},
    {"image": "https://via.placeholder.com/150", "title": "Samsung TV", "price": "\$599"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Wishlist")),
      body: wishlistItems.isEmpty
          ? const Center(
        child: Text("Your wishlist is empty!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      )
          : ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: ListTile(
              leading: Image.network(item["image"], width: 60, height: 60, fit: BoxFit.cover),
              title: Text(item["title"], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item["price"], style: const TextStyle(color: Colors.green)),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    wishlistItems.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
