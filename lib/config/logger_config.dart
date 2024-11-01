import 'package:logger/logger.dart';

class AppLogger {
  static final Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  static void logInfo(String message) {
    logger.i(message);
  }

  static void logError(String message, [dynamic error]) {
    logger.e(message, error: error);
  }

  static void logWarning(String message) {
    logger.w(message);
  }
}
