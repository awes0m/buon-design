import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../apis/product_api.dart';
import '../../../models/product.dart';

final StateNotifierProvider<ProductScreenController, bool>
    productScreenControllerProvider =
    StateNotifierProvider<ProductScreenController, bool>(
        (StateNotifierProviderRef<ProductScreenController, bool> ref) {
  return ProductScreenController(
    productAPI: ref.watch(productAPIProvider),
  );
});

final getAllProductsProvider = FutureProvider.autoDispose((ref) async {
  return ref.read(productAPIProvider).getAllProducts();
});
final filteredProductsProvider =
    FutureProvider.family((ref, String searchString) {
  final productController = ref.watch(productAPIProvider);
  return productController.searchProductsByName(searchString);
});

class ProductScreenController extends StateNotifier<bool> {
  ProductScreenController({
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
