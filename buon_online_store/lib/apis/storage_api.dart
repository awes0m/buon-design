// ignore_for_file: prefer_final_locals

import 'dart:io';

import 'package:buon_online_store/core/core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../core/general_providers.dart';

final Provider<StorageAPI> storageAPIProvider =
    Provider<StorageAPI>((ProviderRef<Object?> ref) {
  return StorageAPI(storageRef: ref.read(firebaseStorageProvider).ref());
});

abstract class IStorageAPI {
  Future<List<String>> fetchProductImages();
  FutureEither<List<String>> uploadImages(List<String> imageFiles);
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
  FutureEither<List<String>> uploadImages(List<String> imageFiles) async {
    List<String> generatedImageUrls = [];
    try {
      for (var imageFile in imageFiles) {
        TaskSnapshot res = await _storageRef.putFile(File(imageFile));
        res.storage.ref().getDownloadURL().then((value) {
          generatedImageUrls.append(value);
        });
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
    return right(generatedImageUrls);
  }
}
