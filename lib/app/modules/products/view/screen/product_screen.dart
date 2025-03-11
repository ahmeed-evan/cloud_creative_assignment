import 'package:ecommerce_app_cloud_creative/app/global/widgets/cusom_appbar.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/cart/controller/cart_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/bindings/product_bindings.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/controller/product_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/view/screen/product_details.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductBindings().dependencies();
    // Dummy Categories
    return controller.obx(
        (state) => Scaffold(
              appBar: const CustomAppBar(title: "Home",),
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextButton(
                            onPressed: () {}, child: const Text("View More"))
                      ],
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final category = controller.categories[index];
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Top Products",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // 🔹 Product Grid
                    Expanded(
                      child: GridView.builder(
                        itemCount: controller.products.length,
                        // +1 for "View More"
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              0.7, // Aspect ratio for better layout
                        ),
                        itemBuilder: (context, index) {
                          final product = controller.products[index];
                          return _buildProductCard(context, product);
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("View More",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
        onLoading: const Center(
          child: CupertinoActivityIndicator(
            radius: 16,
          ),
        ));
  }

  // 🔹 Product Card Widget
  Widget _buildProductCard(BuildContext context, Data product) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          )),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  product.image ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),

              // Product Title
              Text(product.title ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),

              const SizedBox(height: 5),

              // Product Price
              Text(product.price.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.green)),

              const SizedBox(height: 8),

              // Wishlist & Add to Cart Row
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
      ),
    );
  }
}
