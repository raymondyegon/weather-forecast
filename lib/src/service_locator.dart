import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:weather/src/network/api_service.dart';

GetIt sl = GetIt.instance;

// Function to register our services
void setupServiceLocator() {
  // For pretty printing while debbuging
  sl.registerLazySingleton<Logger>(() => Logger(printer: PrettyPrinter()));

  //  To make APi calls
  sl.registerLazySingleton<ApiService>(() => ApiService());
}
