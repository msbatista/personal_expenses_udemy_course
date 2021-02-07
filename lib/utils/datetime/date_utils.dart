import 'package:intl/intl.dart';
import './constants.dart';

String dateFormat(DateTime date,
    {String format = DateTimeConstants.DDMMMYY_HHMM}) {
  return DateFormat(format).format(date);
}
