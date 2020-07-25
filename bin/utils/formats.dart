


import 'package:intl/intl.dart';

class Formats {


  static String formatDate(int numberFormat, {String format}){
    var format =NumberFormat.decimalPattern(); // NumberFormat('###.0#', 'in_ID');
    return format.format(numberFormat);
  }
}