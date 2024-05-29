import 'package:intl/intl.dart';

class AppFormat {
  // Format tanggal bulan tahun
  static String date(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM yyyy', 'en_US').format(dateTime); // 29 Feb 2020
  }

  // Format tanggal bulan
  static String dateMonth(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM', 'en_US').format(dateTime); // 29 Feb
  }

  // Format currency
  static String currency(num number) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(number);
  }
}
