import 'package:intl/intl.dart';

class Util {
  static String getTodayDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
