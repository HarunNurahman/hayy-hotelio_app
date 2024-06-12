import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';

class BookingSource {
  static Future<BookingModel?> isBooked(String userId, String hotelId) async {
    var result = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('booking')
        .where('id_hotel', isEqualTo: hotelId)
        .where('is_done', isEqualTo: false)
        .get();

    if (result.size > 0) {
      return BookingModel.fromJson(result.docs.first.data());
    }

    return null;
  }

  static Future<bool> addBooking(String userId, BookingModel booking) async {
    var ref = FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('booking');

    var result = await ref.add(booking.toJson());

    result.update({'id': result.id});
    return true;
  }

  static Future<List<BookingModel>> getBooking(String userId) async {
    var result = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('booking')
        .get();

    return result.docs.map((e) => BookingModel.fromJson(e.data())).toList();
  }
}
