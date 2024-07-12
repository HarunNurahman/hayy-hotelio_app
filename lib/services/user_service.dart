import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';

class UserService {
  // Mengambil data dari collection user di firestore storage
  CollectionReference reference = FirebaseFirestore.instance.collection('user');

  // Fungsi untuk menyimpan data user kedalam firestore storage
  Future<void> saveUser(UserModel user) async {
    try {
      reference.doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'password': user.password,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi untuk mengambil data user berdasarkan ID
  Future<UserModel> getUserbyId(String id) async {
    try {
      DocumentSnapshot snapshot = await reference.doc(id).get();
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
