import 'dart:convert';

import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  // Fungsi untuk menyimpan user session secara lokal
  Future<void> saveSession(UserModel user) async {
    // Mendeklarasikan shared preferences
    final pref = await SharedPreferences.getInstance();

    // Mengkonvertkan data user ke bentuk map
    Map<String, dynamic> userMap = user.toJson();

    // Menyimpan data user ke shared preferences
    pref.setString('user', userMap.toString());
  }

  Future<UserModel> getSession() async {
    UserModel userModel = UserModel();
    final pref = await SharedPreferences.getInstance();

    // Mengambil data user dari shared preferences
    String? userJson = pref.getString('user');

    // Mengonversi JSON ke Map dan Map ke UserModel
    if (userJson != null) {
      try {
        // Mengubah data user dari bentuk string ke bentuk map
        Map<String, dynamic> userMap = jsonDecode(userJson);
        // Mengkonvertkan data user ke bentuk UserModel
        userModel = UserModel.fromJson(userMap);
      } catch (e) {
        print(e);
      }
    }

    return userModel;
  }

  // Fungsi untuk menghapus user session
  Future<void> deleteSession() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('user');
  }
}
