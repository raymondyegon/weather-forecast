import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather/src/screens/city/city.dart';
import 'package:weather/src/screens/home/home.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

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
              navigatorObservers: <NavigatorObserver>[observer],
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      settings: settings,
                      builder: (_) => Home(),
                    );

                  case '/city':
                    return MaterialPageRoute(
                      settings: settings,
                      builder: (_) => City(),
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
