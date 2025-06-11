import 'dart:io' show Platform;

class ApiConfig {
  static String get baseUrl {
    if (Platform.isAndroid) {
      return "http://10.0.2.2:4000"; // Android emulator
    } else if (Platform.isIOS) {
      return "http://localhost:4000"; // iOS simulator
    } else {
      return "http://localhost:4000"; // Web and other platforms
    }
  }

  static String get authEndpoint => "$baseUrl/auth";
  static String get usersEndpoint => "$baseUrl/users";
  static String get carsEndpoint => "$baseUrl/cars";
} 