import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeCodeConverter {
  format(String waktu) {
    var time_code = 0;
    switch (waktu) {
      case '08:00 - 10.00':
        {
          time_code = 1;
        }
        break;
      case '10:00 - 12.00':
        {
          time_code = 2;
        }
        break;
      case '12:00 - 14.00':
        {
          time_code = 3;
        }
        break;
      case '14:00 - 16.00':
        {
          time_code = 4;
        }
        break;
      case '16:00 - 18.00':
        {
          time_code = 5;
        }
        break;
    }
    return time_code;
  }
}
