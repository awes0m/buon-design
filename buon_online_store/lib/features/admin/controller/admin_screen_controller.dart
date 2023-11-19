import 'package:buon_online_store/apis/product_api.dart';
import 'package:buon_online_store/apis/storage_api.dart';
import 'package:buon_online_store/common/logging_service.dart';
import 'package:buon_online_store/models/image_file_data.dart';
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
    List<ImageFileData> imagePaths,
    double price,
    bool isCustom,
    bool isBestSeller,
  ) async {
    try {
      state = true;
      final NavigatorState navigator = Navigator.of(context);
      localSnackbar(text) => showSnackBar(context, text);
      List<String> imageUrls = await _storageAPI.uploadImages(imagePaths);
      Product newProduct = Product(
        name: name,
        category: category,
        description: description,
        imageUrls: imageUrls,
        availableColors: availableColors,
        price: price,
        isCustom: isCustom,
        isBestSeller: isBestSeller,
      );
      LoggingService.logText(
          'Uploading Product ${newProduct.toJson().toString()}');
      var res = await _productAPI.createNewProduct(newProduct);
      state = false;
      res.fold((l) => localSnackbar(l), (r) {
        localSnackbar('Product created');
        navigator.pop();
      });
    } on Failure catch (e) {
      showSnackBar(context, e.message);
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
