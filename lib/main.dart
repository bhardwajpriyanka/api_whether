import 'package:api_whether/screen/detail/view/detail_screen.dart';
import 'package:api_whether/screen/home/view/home_screen.dart';
import 'package:api_whether/screen/provider/home_provider.dart';
import 'package:api_whether/screen/splse/view/splse_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherScreenProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
         // '/': (context) => const SplseScreen (),
          '/': (context) => const detailScreen(),
          'weather': (context) => const weatherscreen()
        },
      ),
    ),
  );
}