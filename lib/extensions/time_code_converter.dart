

class TimeCodeConverter{
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