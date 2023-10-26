// // import 'package:appwrite/models.dart' as model;

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
  ProductAPI({required FirebaseFirestore db}) : _db = db;
  // _realtime = realtime;
  final FirebaseFirestore _db;

  @override
  FutureEitherVoid createNewProduct(Product productModel) async {
    try {
      final collectionReference = _db.collection("products");
      final collectionExists = await collectionReference.get();
      if (collectionExists.docs.isEmpty) {
        // Collection does not exist, create it
        await collectionReference.add({}); // Add a dummy document
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
    final docRef = await _db.collection("products").get();
    List<Product> fetchedProductsList =
        docRef.docs.map((e) => Product.fromJson(e.data())).toList();
    return fetchedProductsList;
  }

  @override
  Future<List<Product>> searchProductsByName(String searchString) async {
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
}
