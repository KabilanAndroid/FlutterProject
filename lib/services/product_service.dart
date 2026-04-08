import 'package:dio/dio.dart';
import 'package:ro_shops/config.dart';
import 'package:ro_shops/models/product_model.dart';

class ProductService {
  final _dio = Dio();

  Future<List<Product>> getProducts() async {
    final response = await _dio.get('${AppConfig.baseUrl}/api/products');
    final List data = response.data['products'];
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
