import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:logger/logger.dart';

const apiKey = 'a503ed669995242f67a40d91e0269794';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
var logger = Logger();

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '$openWeatherMapUrl?q=$cityName&appid=$apiKey&lang=fr&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    logger.d('on recup la ville');

    logger.d(url);
    var weatherData = await networkHelper.getData();
    logger.d(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    logger.d('getLocationWeather : $getLocationWeather');
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&lang=fr&units=metric');
    logger.d('on recup la meteo par loc');

    var weatherData = await networkHelper.getData();
    logger.d(weatherData);
    return weatherData;
  }

  String getWeatherIcon(var condition) {
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

  String getMessage(var temp) {
    if (temp > 25) {
      return 'c\'est le moment 🍦 ';
    } else if (temp > 20) {
      return 'C\'est un temps pour les shorts et 👕';
    } else if (temp < 10) {
      return 'Tu auras besoin de 🧣 et 🧤';
    } else {
      return 'Apportez un 🧥 juste au cas où';
    }
  }
}
