class AppValueConstants {
  static AppValueConstants? _instance;
  const AppValueConstants._();
  static AppValueConstants get instance => _instance ??= const AppValueConstants._();

  double get lowValue => 8;
  double get normalValue => 12;
  double get mediumValue => 16;
  double get displayValue => 24;
  double get highValue => 32;
  double get bottomBarValue => 90;
}
