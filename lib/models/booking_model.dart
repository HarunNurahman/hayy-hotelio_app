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
  final int? activity;
  final int? totalPayment;
  final String? status;
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
        'id': id,
        'id_hotel': idHotel,
        'cover': cover,
        'name': name,
        'location': location,
        'date': date,
        'guest': guest,
        'breakfast': breakfast,
        'check_in_time': checkInTime,
        'night': night,
        'service_fee': serviceFee,
        'activity': activity,
        'total_payment': totalPayment,
        'status': status,
        'is_done': isDone,
      };

  BookingModel copyWith({
    String? id,
    String? idHotel,
    String? cover,
    String? name,
    String? location,
    String? date,
    int? guest,
    String? breakfast,
    String? checkInTime,
    int? night,
    int? serviceFee,
    int? activity,
    int? totalPayment,
    String? status,
    bool? isDone,
  }) {
    return BookingModel(
      id: id ?? this.id,
      idHotel: idHotel ?? this.idHotel,
      cover: cover ?? this.cover,
      name: name ?? this.name,
      location: location ?? this.location,
      date: date ?? this.date,
      guest: guest ?? this.guest,
      breakfast: breakfast ?? this.breakfast,
      checkInTime: checkInTime ?? this.checkInTime,
      night: night ?? this.night,
      serviceFee: serviceFee ?? this.serviceFee,
      activity: activity ?? this.activity,
      totalPayment: totalPayment ?? this.totalPayment,
      status: status ?? this.status,
      isDone: isDone ?? this.isDone,
    );
  }
}

BookingModel get initBooking => BookingModel(
      id: '',
      idHotel: '',
      cover: '',
      name: '',
      location: '',
      date: '',
      guest: 0,
      breakfast: '',
      checkInTime: '',
      night: 0,
      serviceFee: 0,
      activity: 0,
      totalPayment: 0,
      status: '',
      isDone: false,
    );
