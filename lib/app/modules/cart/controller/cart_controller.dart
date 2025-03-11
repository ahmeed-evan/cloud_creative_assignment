import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:get/get.dart';

class CartController {
  RxList<Data> cartProductsList = <Data>[].obs;
  RxInt totalPrice = 0.obs;

  addOrRemoveToCart(Data product) {
    if (cartProductsList.contains(product)) {
      cartProductsList.remove(product);
    } else {
      cartProductsList.add(product);
    }
    totalPrice.value =
        cartProductsList.fold(0, (sum, item) => sum + item.price!);
  }
}
