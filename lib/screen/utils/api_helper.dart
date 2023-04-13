import 'dart:convert';
import 'package:http/http.dart' as http;
import '../home/model/weather_model.dart';

class ApiHelper
{
  Future<WeatherModel> WeatherApiCall(String name)
  async {
    String link = "https://api.weatherapi.com/v1/current.json?key=6e46df35e2804af1a9775258230904&q=$name&aqi=0883637b00b449c808ba083b3c550e8b";

    Uri uri = Uri.parse(link);

    var result = await http.get(uri);

    var json = jsonDecode(result.body);
    WeatherModel weatherModel = WeatherModel.fromJson(json);
    return weatherModel;
  }
}