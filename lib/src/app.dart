import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather/src/screens/home/home.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            //initialize SizerUtil for responsive ui and global access
            SizerUtil().init(constraints, orientation);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather Tracker',
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      settings: settings,
                      builder: (_) => Home(),
                    );
                  default:
                    return null;
                }
              },
            );
          },
        );
      },
    );
  }
}
