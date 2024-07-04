import 'package:firebase_auth/firebase_auth.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/services/user_service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Sign in function
  Future<UserModel> signIn(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Mengambil uid
      String uid = userCredential.user!.uid;
      UserModel user = await UserService().getUserById(uid);

      // Menyimpan session
      SessionService.saveUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Sign up function
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
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

      await UserService().setUser(user);

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
