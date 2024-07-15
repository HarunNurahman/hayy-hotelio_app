import 'package:firebase_auth/firebase_auth.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/services/user_service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Fungsi sign in dari firebase authentication
  Future<UserModel> signIn(String email, String password) async {
    try {
      // Menyamakan data email dan password
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Inisialiasai untuk mengambil id user
      String uid = userCredential.user!.uid;
      // Mengambil data user berdasarkan id untuk dikembalikan ke UserModel
      UserModel user = await UserService().getUserbyId(uid);
      // Menyimpan user session
      SessionService().saveSession(user);

      // Mengembalikan data user
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi sign up dari firebase authentication
  Future<UserModel> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        password: password,
      );

      await UserService().saveUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
