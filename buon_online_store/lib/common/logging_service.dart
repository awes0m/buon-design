import 'package:logger/logger.dart';

class LoggingService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(colors: true, printEmojis: true),
  );

  static void logText(String text) {
    _logger.d(text);
  }
}
