import 'dart:async';

import 'package:flutter/material.dart';


class SplseScreen extends StatefulWidget {
  const SplseScreen({Key? key}) : super(key: key);

  @override
  State<SplseScreen> createState() => _SplseScreenState();
}

class _SplseScreenState extends State<SplseScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'weather');
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                  "https://cdn.dribbble.com/users/28455/screenshots/1389791/media/c5abb9d81320af5cedd449fdbc8d5408.gif",
                ),
              ),
              SizedBox(height: 100),
              Text(
                "Weather App",

              )
            ],
          ),
        ),
      ),
    );
  }
}