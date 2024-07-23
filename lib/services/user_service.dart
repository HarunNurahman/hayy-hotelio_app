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
  Future<UserModel> getWhereId(String id) async {
    try {
      DocumentReference<Map<String, dynamic>> ref =
          FirebaseFirestore.instance.collection('user').doc(id);

      DocumentSnapshot<Map<String, dynamic>> doc = await ref.get();

      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      rethrow;
    }
  }
}
