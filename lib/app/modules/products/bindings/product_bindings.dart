import 'package:ecommerce_app_cloud_creative/app/modules/products/controller/product_controller.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/repository/product_data_source.dart';
import 'package:get/get.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController(Get.find<ProductDataSource>()));
  }
}
