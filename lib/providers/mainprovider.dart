import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ro_shops/models/product_model.dart';
import 'package:ro_shops/services/product_service.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences not initialized');
});

final isLoggedInProvider = StateProvider<bool>((ref) {
  return ref.watch(sharedPreferencesProvider).getBool('isLoggedIn') ?? false;
});

final usernameProvider = StateProvider<String>((ref) {
  return ref.watch(sharedPreferencesProvider).getString('username') ?? '';
});

final idProvider = StateProvider<String>((ref) {
  return ref.watch(sharedPreferencesProvider).getString('id') ?? '';
});

final emailProvider = StateProvider<String>((ref) {
  return ref.watch(sharedPreferencesProvider).getString('email') ?? '';
});

final productsProvider = FutureProvider<List<Product>>((ref) {
  return ProductService().getProducts();
});
