import 'package:flutter/material.dart';

import 'package:weather/src/screens/city/city_search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CitySearch(),
      ),
    );
  }
}
