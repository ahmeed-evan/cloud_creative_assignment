import 'package:ecommerce_app_cloud_creative/app/global/widgets/cusom_appbar.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/controller/product_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../products/view/screen/product_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Data> filteredProducts = [];

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = [];
      } else {
        filteredProducts = Get.find<ProductController>()
            .products
            .where((product) =>
                product.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search Products"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // 🔹 Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: _filterProducts,
            ),

            const SizedBox(height: 10),

            // 🔹 Search Results
            Expanded(
              child: filteredProducts.isEmpty
                  ? _searchController.text.isEmpty
                      ? const Center(child: Text("Start typing to search..."))
                      : const Center(child: Text("No products found"))
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: Image.network(product.image ?? '',
                                width: 50, height: 50),
                            title: Text(product.title ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(product.price.toString(),
                                style: const TextStyle(color: Colors.green)),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(product: product),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
