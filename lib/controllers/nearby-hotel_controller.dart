import 'package:get/get.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/sources/hotel_source.dart';

class NearbyHotelController extends GetxController {
  final _category = 'All Places'.obs;
  String get category => _category.value;

  set setCategory(n) {
    _category.value = n;
    update();
  }

  List<String> get categories => [
        'All Places',
        'Industrial',
        'Village',
      ];

  final _hotelList = <HotelModel>[].obs;
  List<HotelModel> get hotelList => _hotelList.value;

  getHotelList() async {
    _hotelList.value = await HotelSource.getHotel();
    update();
  }

  @override
  void onInit() {
    getHotelList();
    super.onInit();
  }
}
