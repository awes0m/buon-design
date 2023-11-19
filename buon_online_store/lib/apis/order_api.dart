// // import 'package:appwrite/models.dart' as model;

import 'package:buon_online_store/core/general_providers.dart';
import 'package:buon_online_store/models/order.dart' as order;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../core/core.dart';

final Provider<OrderAPI> orderAPIProvider =
    Provider<OrderAPI>((ProviderRef<OrderAPI> ref) {
  return OrderAPI(
    db: ref.watch(firebaseFirestoreProvider),
  );
});

// //Class Defination
abstract class IOrderAPI {
  FutureEitherVoid createNewOrder(order.Order productModel);
  Future<List<order.Order>> getAllOrders();
  FutureEither<order.Order> getOrderById(String id);
  Future<List<order.Order>> searchOrdersByName(String searchString);
  // FutureEitherVoid updateProduct(Product productModel);
}

class OrderAPI implements IOrderAPI {
  OrderAPI({required FirebaseFirestore db}) : _db = db;
  // _realtime = realtime;
  final FirebaseFirestore _db;

  @override
  FutureEitherVoid createNewOrder(order.Order productModel) async {
    try {
      final collectionReference = _db.collection("orders");
      final collectionExists = await collectionReference.get();
      if (collectionExists.docs.isEmpty) {
        // Collection does not exist, create it
        await collectionReference.add(productModel.toJson());
        return right(null);
        // Add a dummy document
      }
      await _db.collection("orders").add(productModel.toJson());
      return right(null);
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  FutureEither<order.Order> getOrderById(String id) async {
    try {
      final docRef = await _db.collection("products").doc(id).get();
      if (docRef.exists) {
        return right(order.Order.fromJson(docRef.data()!));
      } else {
        return left(Failure("Dosen't Exist"));
      }
    } catch (e) {
      return left(Failure("Error: ${e.toString()}"));
    }
  }

  @override
  Future<List<order.Order>> getAllOrders() async {
    final docRef = await _db.collection("products").get();
    List<order.Order> fetchedProductsList =
        docRef.docs.map((e) => order.Order.fromJson(e.data())).toList();
    return fetchedProductsList;
  }

  @override
  Future<List<order.Order>> searchOrdersByName(String searchString) async {
    var docRef = await _db
        .collection("products")
        .where(
          'name',
          isGreaterThanOrEqualTo: searchString,
        )
        .get();
    List<order.Order> fetchedProductsList =
        docRef.docs.map((e) => order.Order.fromJson(e.data())).toList();
    return (fetchedProductsList);
  }
}
