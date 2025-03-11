import 'package:ecommerce_app_cloud_creative/app/modules/cart/controller/cart_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          // Profile Info Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person_outlined, size: 28),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Doe",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("john.doe@example.com",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Profile Menu Options
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildCard([
                  _buildListTile(
                      Icons.shopping_cart,
                      "Cart (${Get.find<CartController>().cartProductsList.length})",
                      () {}),
                  _buildListTile(
                      Icons.favorite,
                      "Wishlist (${Get.find<WishListController>().wishListProducts.length})",
                      () {}),
                ]),

                _buildCard([
                  _buildListTile(Icons.account_circle, "My Account", () {}),
                  _buildListTile(Icons.shopping_bag, "My Orders", () {}),
                  _buildListTile(Icons.edit, "Edit Profile", () {}),
                  _buildListTile(Icons.payment, "Payment", () {}),
                  _buildListTile(Icons.lock, "Change Password", () {}),
                ]),

                // Logout Button
                Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: _buildListTile(Icons.logout, "Logout", () {},
                      iconColor: Colors.red, textColor: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Card Builder
  Widget _buildCard(List<Widget> children) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(children: children),
    );
  }

  // Reusable ListTile Builder
  Widget _buildListTile(IconData icon, String title, VoidCallback onTap,
      {Color iconColor = Colors.black, Color textColor = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor)),
      onTap: onTap,
    );
  }
}
