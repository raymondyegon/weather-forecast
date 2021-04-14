import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:weather/src/app.dart';
import 'package:weather/src/appstate_container.dart';
import 'package:weather/src/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup services
  setupServiceLocator();

  // Setup logger, only show warning and higher in release mode.
  if (kReleaseMode) {
    Logger.level = Level.warning;
  } else {
    Logger.level = Level.debug;
  }

  // Set the orientation to potrait and start the app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        new StateContainer(
          child: new App(),
        ),
      );
    },
  );
}
