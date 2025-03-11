import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:get/get.dart';

class WishListController {
  RxList<Data> wishListProducts = <Data>[].obs;

  addOrRemoveToWishList(Data product) {
    if (wishListProducts.contains(product)) {
      wishListProducts.remove(product);
    } else {
      wishListProducts.add(product);
    }
  }
}
