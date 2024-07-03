import 'dart:convert';

import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  // Menyimpan session ketika user sign in
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = user.toJson();
    String userJson = jsonEncode(userMap);
    prefs.setString('user', userJson);
  }

  // Mengecek dan mengambil session user apabila telah sign in
  static Future<UserModel> getUser() async {
    UserModel user = UserModel();
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      user = UserModel.fromJson(userMap);
    }
    return user;
  }

  static Future<bool> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    bool success = await prefs.remove('user');
    return success;
  }
}
