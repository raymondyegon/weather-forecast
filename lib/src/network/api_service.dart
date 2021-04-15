import 'package:logger/logger.dart';
import 'package:weather/src/service_locator.dart';

/// Api Service singleton
class ApiService {
  final Logger log = sl.get<Logger>();
}
