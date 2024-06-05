import 'package:get/get.dart';

class NavigationController extends GetxController {
  final _indexPage = 0.obs;
  int get indexPage => _indexPage.value;

  set setIndexPage(n) => _indexPage.value = n;
}
