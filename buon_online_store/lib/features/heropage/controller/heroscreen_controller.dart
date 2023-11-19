import 'package:buon_online_store/apis/product_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/enums.dart';
import '../../../models/product.dart';

final StateNotifierProvider<HomeScreenController, bool>
    homeScreenControllerProvider =
    StateNotifierProvider<HomeScreenController, bool>(
        (StateNotifierProviderRef<HomeScreenController, bool> ref) {
  return HomeScreenController(productAPI: ref.watch(productAPIProvider));
});

final getAllProductsProvider = FutureProvider.autoDispose((ref) async {
  return ref.read(productAPIProvider).getAllProducts();
});
final searchfilteredProductsProvider =
    FutureProvider.family((ref, String searchString) {
  final productController = ref.watch(productAPIProvider);
  return productController.searchProductsByName(searchString);
});
final categoryfilteredProductsProvider =
    FutureProvider.family((ref, List<Categories> categories) {
  final productController = ref.watch(productAPIProvider);
  return productController.getProductsByCategory(categories);
});

class HomeScreenController extends StateNotifier<bool> {
  /// Manages the state of the home screen in a Flutter application.
  /// Provides methods to fetch all products and search for products by name.
  ///
  /// Fields:
  /// - `_productAPI`: An instance of the `ProductAPI` class used to interact with the product API.
  ///
  /// Methods:
  /// - `getAllProducts()`: Fetches all products from the API using the `_productAPI` instance.
  /// - `searchProductsByName(String searchString)`: Searches for products by name using the `_productAPI` instance and returns a list of matching products.
  HomeScreenController({
    required ProductAPI productAPI,
  })  : _productAPI = productAPI,
        super(false);

  final ProductAPI _productAPI;

  /// Fetches all products from the API.
  ///
  /// Returns a list of all products.
  Future<List<Product>> getAllProducts() async {
    return await _productAPI.getAllProducts();
  }

  /// Searches for products by name.
  /// Takes a [searchString] as input and returns a list of products that match the search criteria.
  Future<List<Product>> searchProductsByName(String searchString) async {
    final List<Product> res =
        await _productAPI.searchProductsByName(searchString);
    return res;
  }

  /// Retrieves a list of products based on the provided search categories.
  /// The method takes a list of [Categories] as input and returns a [Future] that resolves to a list of [Product] objects.
  /// Inputs:
  /// - `searchString`: A list of [Categories] that represents the search criteria for products.
  ///
  /// Flow:
  /// 1. The method takes a list of [Categories] as input.
  /// 2. It calls the `_productAPI.getProductsByCategory` method with the `searchString` parameter.
  /// 3. The `_productAPI.getProductsByCategory` method returns a [Future] that resolves to a list of [Product] objects.
  /// 4. The method returns the result of the `_productAPI.getProductsByCategory` method.
  ///
  /// Outputs:
  /// - A [Future] that resolves to a list of [Product] objects that match the search criteria.
  Future<List<Product>> getProductsByCategories(
      List<Categories> categories) async {
    final List<Product> res =
        await _productAPI.getProductsByCategory(categories);
    return res;
  }
}
