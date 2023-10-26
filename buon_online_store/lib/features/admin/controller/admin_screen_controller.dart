import 'package:buon_online_store/apis/product_api.dart';
import 'package:buon_online_store/apis/storage_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../models/product.dart';

final StateNotifierProvider<AdminScreenController, bool>
    adminScreenControllerProvider =
    StateNotifierProvider<AdminScreenController, bool>(
        (StateNotifierProviderRef<AdminScreenController, bool> ref) {
  return AdminScreenController(
      productAPI: ref.watch(productAPIProvider),
      storageAPI: ref.watch(storageAPIProvider));
});

final getAllProductsProvider = FutureProvider.autoDispose((ref) async {
  final productsController = ref.watch(adminScreenControllerProvider.notifier);

  return productsController.getAllProducts();
});

final filteredProductsProvider =
    FutureProvider.family((ref, String searchString) {
  final productController = ref.watch(productAPIProvider);
  return productController.searchProductsByName(searchString);
});

class AdminScreenController extends StateNotifier<bool> {
  AdminScreenController({
    required ProductAPI productAPI,
    required StorageAPI storageAPI,
  })  : _productAPI = productAPI,
        _storageAPI = storageAPI,
        super(false);
  final ProductAPI _productAPI;
  final StorageAPI _storageAPI;

  Future<List<Product>> getAllProducts() async {
    return await _productAPI.getAllProducts();
  }

  Future<List<Product>> searchProductsByName(String searchString) async {
    final List<Product> res = await _productAPI.getAllProducts();
    return res;
  }

  FutureEither<Product> getProductById(String id) async {
    return await _productAPI.getProductById(id);
  }

  FutureVoid createANewProduct(
    BuildContext context,
    String name,
    String category,
    String description,
    List<String> availableColors,
    List<String> imagePaths,
    double price,
  ) async {
    List<String> uploadedImageUrls = [];
    // Upload Images to storage
    try {
      var res = await _storageAPI.uploadImages(imagePaths);
      res.fold((l) => showSnackBar(context, l.message),
          (r) => uploadedImageUrls = r);

      if (uploadedImageUrls.isNotEmpty) {
        Product product = Product(
            name: name,
            category: category,
            description: description,
            imageUrls: uploadedImageUrls,
            availableColors: availableColors,
            price: price);
        await _productAPI.createNewProduct(product);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
