import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';

class UserSource {
  static Future<Map<String, dynamic>> signIn(
    String email,
    String password,
  ) async {
    Map<String, dynamic> response = {};
    try {
      final credential =
          await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      response['success'] = true;
      response['message'] = 'Sign In Success';

      String uid = credential.user!.uid;
      UserModel user = await getWhereId(uid);

      SessionService.saveUser(user);
    } on auth.FirebaseAuthException catch (e) {
      response['success'] = false;

      if (e.code == 'user-not-found') {
        response['message'] = 'No User Found For This Email';
      } else if (e.code == 'wrong-password') {
        response['message'] = 'Wrong Password';
      } else {
        response['message'] = e.code;
      }
    }

    return response;
  }

  static Future<UserModel> getWhereId(String id) async {
    DocumentReference<Map<String, dynamic>> ref =
        FirebaseFirestore.instance.collection('user').doc(id);
    DocumentSnapshot<Map<String, dynamic>> doc = await ref.get();
    return UserModel.fromJson(doc.data()!);
  }
}
