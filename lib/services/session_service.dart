import 'dart:convert';

import 'package:get/get.dart';
import 'package:hayy_hotelio_app/controllers/user_controller.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  // Menyimpan session user
  static Future<bool> saveUser(UserModel user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await pref.setString('user', stringUser);

    if (success) {
      final userController = Get.put(UserController());
      userController.setData(user);
    }

    return success;
  }

  // Mengambil data user
  static Future<UserModel> getUser() async {
    UserModel user = UserModel();
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');

    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = UserModel.fromJson(mapUser);
    }

    final userController = Get.put(UserController());
    userController.setData(user);

    return user;
  }

  // Clear user session
  static Future<bool> clearUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');

    final userController = Get.put(UserController());
    userController.setData(UserModel());

    return success;
  }
}
