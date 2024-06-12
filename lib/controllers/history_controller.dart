import 'package:get/get.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/sources/booking_source.dart';

class HistoryController extends GetxController {
  final _bookingList = <BookingModel>[].obs;
  List<BookingModel> get bookingList => _bookingList;

  getHotelList(String userId) async {
    _bookingList.value = await BookingSource.getBooking(userId);
    update();
  }
}
