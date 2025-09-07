import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/service/database_service.dart';

class FirestoreService extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> saveData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>?> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkDocumentExists({
    required String path,
    required String documentId,
  }) {
    var doc = firestore.collection(path).doc(documentId).get();
    return doc.then((value) => value.exists);
  }
}
