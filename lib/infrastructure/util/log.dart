import 'dart:developer';

class Log {
  static void debug(String eventDescription) {
    var eventTime = DateTime.now().toIso8601String();
    log('$eventTime $eventDescription');
  }
}