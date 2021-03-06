import 'location.dart';
import 'networking.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const appId = '4588b2cc411699043d594b83150b6b83';

class WeatherModel {

  Future <dynamic>getCityWeather(String city) async{
   NetworkHelper helper=NetworkHelper('$openWeatherMapURL?q=$city&appid=$appId&units=metric');
   var data=await helper.getData();
   return data;
  }
  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    String url =
        '$openWeatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$appId&units=metric';
    NetworkHelper helper = NetworkHelper(url);
    var data = await helper.getData();
    return data;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
