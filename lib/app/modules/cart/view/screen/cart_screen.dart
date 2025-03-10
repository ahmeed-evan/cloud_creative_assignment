import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Dummy cart items
  List<Map<String, dynamic>> cartItems = [
    {"image": "https://via.placeholder.com/150", "title": "iPhone 14", "price": 999.0},
    {"image": "https://via.placeholder.com/150", "title": "MacBook Pro", "price": 1999.0},
    {"image": "https://via.placeholder.com/150", "title": "Samsung TV", "price": 599.0},
    {"image": "https://via.placeholder.com/150", "title": "Sony Headphones", "price": 299.0},
  ];

  // Calculate total price
  double get totalPrice => cartItems.fold(0.0, (sum, item) => sum + item["price"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        children: [
          // Cart Item List
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text("Your cart is empty"))
                : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return _buildCartItem(item, index);
              },
            ),
          ),

          // Cart Summary & Checkout
          if (cartItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Total Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("\$${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Proceeding to order...")),
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
    );
  }

  // 🔹 Cart Item Widget
  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Image.network(item["image"], width: 60, height: 60, fit: BoxFit.cover),
        title: Text(item["title"], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("\$${item["price"]}", style: const TextStyle(color: Colors.green)),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() {
              cartItems.removeAt(index);
            });
          },
        ),
      ),
    );
  }
}
