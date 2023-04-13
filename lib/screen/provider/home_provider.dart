import 'package:api_whether/screen/utils/api_helper.dart';
import 'package:flutter/cupertino.dart';


import '../home/model/weather_model.dart';

class WeatherScreenProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  WeatherModel? weatherModel;


  String Name = "Surat";
  TextEditingController txtcityname = TextEditingController();

  void changeData(String name){
    Name = name;
    notifyListeners();
  }

  Future<WeatherModel?> weatherData(String name) async {
    weatherModel = await apiHelper.WeatherApiCall(name);
    return weatherModel;
  }
}