import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../shared/presentation/utils/resource.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../../shared/domain/types/category_product_type.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../domain/admin_repository_interface.dart';

class AdminRepositoryImplements extends AdminRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  AdminRepositoryImplements(this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<ResultOr<FirebaseFailure>> addProduct(
      {required String name,
      required String description,
      required CategoryProductType category,
      required String imagePath,
      required double price,
      required double oldPrice}) {
    throw UnimplementedError();
  }

  @override
  Future<ResultOr<FirebaseFailure>> deleteProduct({required String productId}) {
    throw UnimplementedError();
  }

  @override
  Future<ResultOr<FirebaseFailure>> getProducts() {
    throw UnimplementedError();
  }

  @override
  Future<Resource<FirebaseFailure, String>> uploadImageProduct(
      {required String imagePath}) async {
    final remotePath = 'products/photos/$imagePath';
    final storageReference = FirebaseStorage.instance.ref(remotePath);
    try {
      final task = await storageReference.putFile(File(imagePath));
      final url = await task.ref.getDownloadURL();
      return Resource.success(url);
    } on FirebaseException catch (e, _) {
      return Resource.failure(FirebaseFailure.unknownError());
    }
  }
}
