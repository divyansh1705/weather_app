import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey='3edee390c1437226710419902efe675d';
const openWeatherURL='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityData(String cityName) async{
    Network networkHelper=Network(url: '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();

    Network networkHelper=Network(url:'$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData=await networkHelper.getData();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
