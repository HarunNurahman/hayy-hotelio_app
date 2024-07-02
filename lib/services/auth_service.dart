import 'package:firebase_auth/firebase_auth.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
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

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
