import 'package:intl/intl.dart';

abstract class DateOfDay {
  static String getDataOfDay() {
    DateTime date = DateTime.now();
    String formatted = DateFormat('MMMM d, y').format(date);

    return formatted;
  }
}
