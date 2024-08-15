final class AppConstants {
  static AppConstants? _instance;
  const AppConstants._();
  static AppConstants get instance => _instance ??= const AppConstants._();

  String get appName => "Xox";
}
