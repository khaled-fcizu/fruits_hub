abstract class DatabaseService {
  Future<void> saveUserData({
    required String path,
    required Map<String, dynamic> userData,
  });
}