import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location;
  String temp;
  String humidity;
  String air_speed;
  String description;
  String main;
  String icon;

  //Constructor
  Worker({required this.location})
      : temp = '',
        humidity = '',
        air_speed = '',
        description = '',
        main = '',
        icon = '';
  //method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9e3845a167c0b0185c9973d0aa014553"));
      Map data = jsonDecode(response.body);

      // Getting Temp, Humidity
      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

      // Getting air_speed
      Map wind = data['wind'];
      double getAirSpeed = wind["speed"] / 0.27777777777778;

      // Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];
      

      // Assigning Values
      temp = getTemp.toString(); // C
      humidity = getHumidity; // %
      air_speed = getAirSpeed.toString(); // km/hr
      description = getDesc;
      main = getMainDes;
      icon = weatherMainData["icon"].toString();

    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "03n";
    }
  }
}
