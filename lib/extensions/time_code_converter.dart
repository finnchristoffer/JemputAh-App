class TimeConverter {
  format(String waktu) {
    var timeCode = 0;
    switch (waktu) {
      case '08:00 - 10.00':
        {
          timeCode = 1;
        }
        break;
      case '10:00 - 12.00':
        {
          timeCode = 2;
        }
        break;
      case '12:00 - 14.00':
        {
          timeCode = 3;
        }
        break;
      case '14:00 - 16.00':
        {
          timeCode = 4;
        }
        break;
      case '16:00 - 18.00':
        {
          timeCode = 5;
        }
        break;
    }
    return timeCode;
  }
}

class TimeCodeConverter {
  String timeCodeConverter(var data) {
    var time = "";
    switch (data) {
      case 1:
        {
          time = "08:00 - 10:00";
        }
        break;
      case 2:
        {
          time = "10:00 - 12:00";
        }
        break;
      case 3:
        {
          time = "12:00 - 14:00";
        }
        break;
      case 4:
        {
          time = "14:00 - 16:00";
        }
        break;
      case 5:
        {
          time = "16:00 - 18:00";
        }
        break;
    }
    return time;
  }
}

class TimeCodeConverterHour {
  String timeCodeConverterHour(var data) {
    var time = "";
    switch (data) {
      case 1:
        {
          time = "10:00";
        }
        break;
      case 2:
        {
          time = "12:00";
        }
        break;
      case 3:
        {
          time = "14:00";
        }
        break;
      case 4:
        {
          time = "16:00";
        }
        break;
      case 5:
        {
          time = "18:00";
        }
        break;
    }
    return time;
  }
}
