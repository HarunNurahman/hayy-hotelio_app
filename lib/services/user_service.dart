import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';

class UserService {
  // Mengambil data dari collection di firestore database
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('user');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'password': user.password,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Mengambil data user berdasarkan ID
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        password: snapshot['password'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
