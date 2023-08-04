import 'package:intl/intl.dart';

class FormatHelper {
  static String formatDate(String time){
    var _parsedDate = DateTime.parse(time);
    final DateFormat dateFormat = DateFormat('dd MMMM yyyy');

    String dateFormatted = dateFormat.format(_parsedDate);

    return dateFormatted;
  }

  static String formatTime(String time){
    var _parsedDate = DateTime.parse(time);
    final DateFormat timeFormat = DateFormat('HH:mm:ss');
    String timeFormatted = timeFormat.format(_parsedDate);

    return timeFormatted;
  }
}