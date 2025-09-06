import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/service/database_service.dart';

class FirestoreService extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> saveUserData({
    required String path,
    required Map<String, dynamic> userData,
  }) async {
    await firestore.collection(path).add(userData);
  }
}
