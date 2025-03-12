import 'package:ecommerce_app_cloud_creative/app/global/widgets/cusom_appbar.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/cart/controller/cart_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/controller/product_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/view/screen/product_details.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductController controller = Get.find<ProductController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  // 🔹 Detect when user reaches bottom
  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !controller.isLoadingMore.value) {
      if (controller.currentPage == 2) return;
      controller.loadMoreProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        appBar: const CustomAppBar(title: "Home"),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Categories
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),

              // 🔹 Infinite Scrolling Product Grid
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    controller: _scrollController, // Attach controller
                    itemCount: controller.products.length +
                        (controller.isLoadingMore.value ? 1 : 0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      if (index == controller.products.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        ); // Loading indicator at bottom
                      }
                      final product = controller.products[index];
                      return _buildProductCard(context, product);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // 🔹 Product Card Widget
  Widget _buildProductCard(BuildContext context, Data product) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
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
                      onPressed: () =>
                          Get.find<CartController>().addOrRemoveToCart(product),
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
