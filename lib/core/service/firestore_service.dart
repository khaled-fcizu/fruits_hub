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
  Future<dynamic> getData({
    Map<String, dynamic>? query,
    required String path,
    String? documentId,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orederByField = query['orederBy'];
          var descendingField = query['descending'];
          data = data.orderBy(orederByField, descending: descendingField);
        }
        if (query['limit'] != null) {
          var limitField = query['limit'];
          data = data.limit(limitField);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
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
