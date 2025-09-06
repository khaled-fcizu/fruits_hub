class UserEntitiy {
  final String email;
  final String uid;
  final String name;
  UserEntitiy({required this.email, required this.uid, required this.name});

  toJson() {
    return {
      'email': email,
      'uid': uid,
      'name': name,
    };
  }
}
