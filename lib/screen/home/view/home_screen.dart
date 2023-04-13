import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class weatherscreen extends StatefulWidget {
  const weatherscreen({Key? key}) : super(key: key);

  @override
  State<weatherscreen> createState() => _AddDataState();
}

class _AddDataState extends State<weatherscreen> {
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
        body: Stack(
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
                TextField(
                  controller: weatherScreenProviderFalse!.txtcityname,
                  decoration: InputDecoration(
                    hintText: "Search ",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                    filled: true,
                    fillColor: Colors.black12,
                    focusColor: Colors.black12,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                        width: 2,
                        color: Colors.black12,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    String name = weatherScreenProviderTrue!.txtcityname.text;

                    if(name.isNotEmpty){
                      print(name);
                      weatherScreenProviderFalse!.changeData(name);
                      Navigator.pop(context);
                    }
                    else{
                      weatherScreenProviderFalse!.changeData(weatherScreenProviderTrue!.Name);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 175,
                      decoration: BoxDecoration(
                        border: Border.all(
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                     child: Text("Weather Patter")
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}