import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';

class BookingService {
  // Fungsi untuk cek apakah sudah terbooking atau belum
  static Future<BookingModel?> isBooked(String userId, String hotelId) async {
    try {
      // Memeriksan perubahan status di tabel id_hotel dan is_done dari collection booking didalam collection user
      var result = await FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .collection('booking')
          .where('id_hotel', isEqualTo: hotelId)
          .where('is_done', isEqualTo: false)
          .get();

      // Apabila datanya ada maka akan di konversi ke bentuk HotelModel
      if (result.size > 0) {
        return BookingModel.fromJson(result.docs.first.data());
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Fungsi untuk menambahkan collection dan data booking didalam collection user
  static Future<bool> addBooking(String userId, BookingModel booking) async {
    try {
      // Mendapatkan referensi ke koleksi 'booking' dalam dokumen pengguna yang sesuai.
      var query = FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .collection('booking');

      // Menambahkan dokumen baru ke dalam koleksi 'booking'.
      var result = await query.add(booking.toJson());

      // Memperbarui dokumen yang baru saja ditambahkan dengan id
      result.update({'id': result.id});
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Mengambil semua data booking
  static Future<List<BookingModel>> getBooking(String userId) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .collection('booking')
          .get();

      return result.docs.map((e) => BookingModel.fromJson(e.data())).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
