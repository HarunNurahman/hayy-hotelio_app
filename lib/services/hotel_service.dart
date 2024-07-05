import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';

class HotelService {
  Future<List<HotelModel>> getHotelList() async {
    // Mengambil data hotel dari firebase firestore dari collection 'hotel' lalu disimpan ke variabel list
    var list = await FirebaseFirestore.instance.collection('hotel').get();

    // Mengubah map menjadi list
    return list.docs.map((e) => HotelModel.fromJson(e.data())).toList();
  }

  Future<HotelModel> getHotelById(String id) async {
    // Mengambil id hotel dari collection hotel di firebase firestore
    var doc =
        await FirebaseFirestore.instance.collection('hotel').doc(id).get();
    return HotelModel.fromJson(doc.data()!);
  }

  Future<List<HotelModel>> getHotelByCategory(String category) async {
    var list = await FirebaseFirestore.instance
        .collection('hotel')
        .where('category', isEqualTo: category)
        .get();
    return list.docs.map((e) => HotelModel.fromJson(e.data())).toList();
  }
}
