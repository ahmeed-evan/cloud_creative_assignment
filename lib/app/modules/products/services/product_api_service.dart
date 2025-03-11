import 'package:ecommerce_app_cloud_creative/app/global/services/api_service.dart';

class ProductApiService {
  final ApiService _apiService;

  ProductApiService(this._apiService);

  Future<Map<String, dynamic>> getProducts(String endPoint) async {
    return await _apiService.get(endPoint);
  }
}
