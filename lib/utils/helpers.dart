import 'package:intl/intl.dart';

class Helpers {
  static String formatToRpCurrency(num amount) {
    var rpFormat = NumberFormat.currency(locale: "id_ID", symbol: "Rp ");
    return rpFormat.format(amount);
  }
}
