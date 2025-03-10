import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/services/product_api_service.dart';

abstract class ProductDataSource {
  getProducts();
}

class ProductDataSourceImp implements ProductDataSource {
  final ProductApiService _productApiService;

  ProductDataSourceImp(this._productApiService);

  @override
  Future getProducts() async {
    Map<String, dynamic> response = await _productApiService.getProducts();
    return response["status"] == "success"
        ? Product.fromJson(response['data'])
        : [];
  }
}
