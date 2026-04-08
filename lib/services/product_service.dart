import 'package:dio/dio.dart';
import 'package:ro_shops/config.dart';
import 'package:ro_shops/models/product_model.dart';

class ProductService {
  final _dio = Dio();

  String get _baseUrl => AppConfig.baseUrl;

  Future<List<Product>> getProducts() async {
    final response = await _dio.get('$_baseUrl/api/products');
    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
