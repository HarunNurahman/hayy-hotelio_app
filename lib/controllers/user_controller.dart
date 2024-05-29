import 'package:get/get.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';

class UserController extends GetxController {
  final _data = UserModel().obs;
  UserModel get data => _data.value;
  setData(UserModel data) => _data.value = data;
}
