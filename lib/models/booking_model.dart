class BookingModel {
  final String? id;
  final String? idHotel;
  final String? cover;
  final String? name;
  final String? location;
  final String? date;
  final int? guest;
  final String? breakfast;
  final String? checkInTime;
  final int? night;
  final int? serviceFee;
  final String? activity;
  final int? totalPayment;
  final int? status;
  final bool? isDone;

  BookingModel({
    this.id,
    this.idHotel,
    this.cover,
    this.name,
    this.location,
    this.date,
    this.guest,
    this.breakfast,
    this.checkInTime,
    this.night,
    this.serviceFee,
    this.activity,
    this.totalPayment,
    this.status,
    this.isDone,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        idHotel: json["id_hotel"],
        cover: json["cover"],
        name: json["name"],
        location: json["location"],
        date: json["date"],
        guest: json["guest"],
        breakfast: json["breakfast"],
        checkInTime: json["check_in_time"],
        night: json["night"],
        serviceFee: json["service_fee"],
        activity: json["activity"],
        totalPayment: json["total_payment"],
        status: json["status"],
        isDone: json["is_done"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_hotel": idHotel,
        "cover": cover,
        "name": name,
        "location": location,
        "date": date,
        "guest": guest,
        "breakfast": breakfast,
        "check_in_time": checkInTime,
        "night": night,
        "service_fee": serviceFee,
        "activity": activity,
        "total_payment": totalPayment,
        "status": status,
        "is_done": isDone,
      };
}
