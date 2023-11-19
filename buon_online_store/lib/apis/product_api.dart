// // import 'package:appwrite/models.dart' as model;

import 'package:buon_online_store/core/enums.dart';
import 'package:buon_online_store/core/general_providers.dart';
import 'package:buon_online_store/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../core/core.dart';

final Provider<ProductAPI> productAPIProvider =
    Provider<ProductAPI>((ProviderRef<ProductAPI> ref) {
  return ProductAPI(
    db: ref.watch(firebaseFirestoreProvider),
  );
});

// //Class Defination
abstract class IProductAPI {
  FutureEitherVoid createNewProduct(Product productModel);
  Future<List<Product>> getAllProducts();
  FutureEither<Product> getProductById(String id);
  Future<List<Product>> searchProductsByName(String searchString);
  // FutureEitherVoid updateProduct(Product productModel);
}

class ProductAPI implements IProductAPI {
  /// A class responsible for interacting with the Firestore database to perform CRUD operations on the "products" collection.
  /// Implements the `IProductAPI` interface.

  /// ```
  ///
  /// Fields:
  /// - `_db`: An instance of `FirebaseFirestore` used to interact with the Firestore database.
  ///
  /// Methods:
  /// - `createNewProduct`: Creates a new product in the Firestore database. If the "products" collection does not exist, it creates the collection and adds the product as a document. Returns a `FutureEitherVoid` indicating success or failure.
  /// - `getProductById`: Retrieves a product by its ID from the Firestore database. Returns a `FutureEither<Product>` with the retrieved product or an error message if the product does not exist.
  /// - `getAllProducts`: Retrieves all products from the Firestore database. Returns a `Future<List<Product>>` with a list of all products.
  /// - `searchProductsByName`: Searches for products by name in the Firestore database. Returns a `Future<List<Product>>` with a list of matching products.
  /// - `getProductsByCategory`: Retrieves products by category from the Firestore database. Takes a list of `Categories` as input and returns a `Future<List<Product>>` with a list of matching products.
  ProductAPI({required FirebaseFirestore db}) : _db = db;

  final FirebaseFirestore _db;

  @override
  FutureEitherVoid createNewProduct(Product productModel) async {
    /// Creates a new product in the Firestore database.
    /// If the "products" collection does not exist, it creates the collection and adds the product as a document.
    /// Returns a `FutureEitherVoid` indicating success or failure.
    try {
      final collectionReference = _db.collection("products");
      final collectionExists = await collectionReference.get();
      if (collectionExists.docs.isEmpty) {
        // Collection does not exist, create it
        await collectionReference.add(productModel.toJson());
        return right(null);
        // Add a dummy document
      }
      await _db.collection("products").add(productModel.toJson());
      return right(null);
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  FutureEither<Product> getProductById(String id) async {
    /// Retrieves a product by its ID from the Firestore database.
    /// Returns a `FutureEither<Product>` with the retrieved product or an error message if the product does not exist.
    try {
      final docRef = await _db.collection("products").doc(id).get();
      if (docRef.exists) {
        return right(Product.fromJson(docRef.data()!));
      } else {
        return left(Failure("Dosen't Exist"));
      }
    } catch (e) {
      return left(Failure("Error: ${e.toString()}"));
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    /// Retrieves all products from the Firestore database.
    /// Returns a `Future<List<Product>>` with a list of all products.
    final docRef = await _db.collection("products").get();
    List<Product> fetchedProductsList =
        docRef.docs.map((e) => Product.fromJson(e.data())).toList();
    return fetchedProductsList;
  }

  @override
  Future<List<Product>> searchProductsByName(String searchString) async {
    /// Searches for products by name in the Firestore database.
    /// Returns a `Future<List<Product>>` with a list of matching products.
    var docRef = await _db
        .collection("products")
        .where(
          'name',
          isGreaterThanOrEqualTo: searchString,
        )
        .get();
    List<Product> fetchedProductsList =
        docRef.docs.map((e) => Product.fromJson(e.data())).toList();
    return (fetchedProductsList);
  }

  Future<List<Product>> getProductsByCategory(
      List<Categories> categories) async {
    /// Retrieves products by category from the Firestore database.
    /// Takes a list of `Categories` as input and returns a `Future<List<Product>>` with a list of matching products.
    var docRef = await _db
        .collection("products")
        .where(
          'category',
          whereIn: categories.map((e) => e.name).toList(),
        )
        .get();
    List<Product> fetchedProductsList =
        docRef.docs.map((e) => Product.fromJson(e.data())).toList();
    return (fetchedProductsList);
  }
}
