abstract class TimeManager {
  static const Duration mill250 = Duration(milliseconds: TimeValueManager.t250);
  static const Duration mill500 = Duration(milliseconds: TimeValueManager.t500);
}

abstract class TimeValueManager {
  static const int t250 = 250;
  static const int t500 = 500;
}
