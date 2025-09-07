abstract class DatabaseService {
  Future<void> saveData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<Map<String, dynamic>?> getData({
    required String path,
    required String documentId,
  });
  Future<bool> checkDocumentExists({
    required String path,
    required String documentId,
  });
}
