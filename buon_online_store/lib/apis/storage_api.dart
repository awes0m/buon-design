// ignore_for_file: prefer_final_locals

import 'package:buon_online_store/core/core.dart';
import 'package:buon_online_store/models/image_file_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/logging_service.dart';
import '../core/general_providers.dart';

final Provider<StorageAPI> storageAPIProvider =
    Provider<StorageAPI>((ProviderRef<Object?> ref) {
  return StorageAPI(storageRef: ref.read(firebaseStorageProvider).ref());
});

abstract class IStorageAPI {
  Future<List<String>> fetchProductImages();
  Future<List<String>> uploadImages(List<ImageFileData> imageFiles,
      {String? name});
  Future<List<String>> fetchCarouselImages();
}

class StorageAPI implements IStorageAPI {
  StorageAPI({required Reference storageRef}) : _storageRef = storageRef;
  final Reference _storageRef;

  @override
  Future<List<String>> uploadImages(List<ImageFileData> imageFiles,
      {String? name}) async {
    List<String> imageUrls = [];
    try {
      for (var imageFile in imageFiles) {
        String fileName = '${name ?? name}_${getRandomString(10)}';
        TaskSnapshot res = await _storageRef
            .child('productImages/$fileName')
            .putData(imageFile.bytes,
                SettableMetadata(contentType: imageFile.metadata));
        imageUrls.add(
            await res.storage.ref('productImages/$fileName').getDownloadURL());
      }
      LoggingService.logText(imageUrls.toString());
    } on FirebaseException catch (e) {
      LoggingService.logText(e.message!);
    }
    return imageUrls;
  }

  @override
  Future<List<String>> fetchCarouselImages() {
    throw UnimplementedError();
  }

  @override
  Future<List<String>> fetchProductImages() {
    throw UnimplementedError();
  }
}
