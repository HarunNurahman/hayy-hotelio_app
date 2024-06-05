import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';

class HotelSource {
  static Future<List<HotelModel>> getHotel() async {
    var result = await FirebaseFirestore.instance.collection('hotel').get();
    print('Cek ${result.docs.length}');
    return result.docs.map((e) => HotelModel.fromJson(e.data())).toList();
  }
}
