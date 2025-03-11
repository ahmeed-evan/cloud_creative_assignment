import 'package:ecommerce_app_cloud_creative/app/global/services/api_service.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/cart/controller/cart_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/repository/product_data_source.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/services/product_api_service.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/wishlist/controller/wishlist_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    ApiService apiService = ApiService();
    ProductApiService productApiService = ProductApiService(apiService);
    Get.put<ProductDataSource>(ProductDataSourceImp(productApiService),
        permanent: true);
    Get.put(WishListController(), permanent: true);
    Get.put(CartController(), permanent: true);
  }
}
