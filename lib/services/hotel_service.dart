import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';

class HotelService {
  // Fungsi ini mengambil daftar hotel dari koleksi 'hotel' di Firebase Firestore dan mengonversinya menjadi daftar objek HotelModel
  Future<List<HotelModel>> getHotelList() async {
    try {
      // Mengambil data dari koleksi 'hotel' di Firebase Firestore
      var list = await FirebaseFirestore.instance.collection('hotel').get();

      // Mengonversi data ke objek HotelModel
      return list.docs.map((e) => HotelModel.fromJson(e.data())).toList();
    } catch (e) {
      print('Error $e');
      rethrow;
    }
  }

  // mengambil data hotel dari Firestore berdasarkan ID dokumen dan mengonversinya menjadi objek HotelModel
  Future<HotelModel?> getHotelById(String id) async {
    try {
      // Mengambil data dari firestore
      var doc =
          await FirebaseFirestore.instance.collection('hotel').doc('id').get();

      // Mengecek apakah datanya tersedia
      if (doc.exists && doc.data() != null) {
        return HotelModel.fromJson(doc.data()!);
      } else {
        print('No such document!');
        return null;
      }
    } catch (e) {
      print('Error $e');
      rethrow;
    }
  }

  Future<List<HotelModel>> getHotelByCategory(String category) async {
    var list = await FirebaseFirestore.instance
        .collection('hotel')
        .where('category', isEqualTo: category)
        .get();
    return list.docs.map((e) => HotelModel.fromJson(e.data())).toList();
  }
}
