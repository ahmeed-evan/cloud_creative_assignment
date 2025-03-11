import 'package:ecommerce_app_cloud_creative/app/modules/products/models/product.dart';
import 'package:ecommerce_app_cloud_creative/app/modules/products/services/product_api_service.dart';

abstract class ProductDataSource {
  Future<List<Data>?> getProducts(String endPoint);
}

class ProductDataSourceImp implements ProductDataSource {
  final ProductApiService _productApiService;

  ProductDataSourceImp(this._productApiService);

  @override
  Future<List<Data>?> getProducts(String endPoint) async {
    Map<String, dynamic> response =
        await _productApiService.getProducts(endPoint);
    return response["status"] == "success"
        ? Product.fromJson(response).data
        : [];
  }
}
