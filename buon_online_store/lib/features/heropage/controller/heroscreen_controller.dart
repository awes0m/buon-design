import 'package:buon_online_store/apis/product_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/custom_product.dart';

final StateNotifierProvider<HomeScreenController, bool>
    homeScreenControllerProvider =
    StateNotifierProvider<HomeScreenController, bool>(
        (StateNotifierProviderRef<HomeScreenController, bool> ref) {
  return HomeScreenController(productAPI: ref.watch(productAPIProvider));
});

final getAllProductsProvider = FutureProvider.autoDispose((ref) async {
  return ref.read(productAPIProvider).getAllProducts();
});
final filteredProductsProvider =
    FutureProvider.family((ref, String searchString) {
  final productController = ref.watch(productAPIProvider);
  return productController.searchProductsByName(searchString);
});

class HomeScreenController extends StateNotifier<bool> {
  HomeScreenController({
    required ProductAPI productAPI,
  })  : _productAPI = productAPI,
        super(false);
  final ProductAPI _productAPI;

  Future<List<Product>> getAllProducts() async {
    return await _productAPI.getAllProducts();
  }

  Future<List<Product>> searchProductsByName(String searchString) async {
    final List<Product> res = await _productAPI.getAllProducts();
    return res;
  }
}
