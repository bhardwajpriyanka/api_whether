import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/model/weather_model.dart';
import '../../provider/home_provider.dart';


class detailScreen extends StatefulWidget {
  const detailScreen({Key? key}) : super(key: key);

  @override
  State<detailScreen> createState() => _weatherScreenState();
}

class _weatherScreenState extends State<detailScreen> {
  WeatherScreenProvider? weatherScreenProviderTrue;
  WeatherScreenProvider? weatherScreenProviderFalse;

  @override
  Widget build(BuildContext context) {
    weatherScreenProviderFalse =
        Provider.of<WeatherScreenProvider>(context, listen: false);
    weatherScreenProviderTrue =
        Provider.of<WeatherScreenProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: weatherScreenProviderFalse!.weatherData(weatherScreenProviderTrue!.Name),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error}");
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      "assets/images/weather.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Text(
                                "${weatherModel!.location.name} ${weatherModel.location.region} , ${weatherModel.location.country}",
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Text(
                                "${weatherModel.current.tempC} °C",style: TextStyle(color: Colors.black54),

                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Current Time     :-     ${weatherModel.location.localtime}",style: TextStyle(color: Colors.black54,),

                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Last Update Time      :-     ${weatherModel.current.lastUpdated}",style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Wind Degree      :-     ${weatherModel.current.windDegree}",

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 15,
                                      left: 75,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, 'weather');
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
