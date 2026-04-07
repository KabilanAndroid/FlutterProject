import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoggedInProvider = StateProvider<bool>((ref) => false);
final usernameProvider = StateProvider<String>((ref) => '');
final idProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
