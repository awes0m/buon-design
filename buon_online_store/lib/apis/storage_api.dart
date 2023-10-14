// ignore_for_file: prefer_final_locals

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/general_providers.dart';

final Provider<StorageAPI> storageAPIProvider =
    Provider<StorageAPI>((ProviderRef<Object?> ref) {
  return StorageAPI(storageRef: ref.read(firebaseStorageProvider).ref());
});

abstract class IStorageAPI {
  Future<List<String>> fetchProductImages();
  Future<List<String>> uploadImages(List<String> imageFiles);
  Future<List<String>> fetchCarouselImages();
}

class StorageAPI implements IStorageAPI {
  StorageAPI({required Reference storageRef}) : _storageRef = storageRef;
  final Reference _storageRef;

  @override
  Future<List<String>> fetchCarouselImages() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>> fetchProductImages() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>> uploadImages(List<String> imageFiles) {
    throw UnimplementedError();
  }
}
