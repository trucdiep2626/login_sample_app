class NetworkConfig {
  static const int timeout = 3000000;
  static const String contentType = 'application/json; charset=utf-8';

  //auth
  static String login = 'itinerary/auth/sign-in';
  static String sendSignUpCode = 'itinerary/auth/send-sign-up-code';
  static String register = 'itinerary/auth/register';
  static String logout = 'authentication/logout';
  static String refreshToken = 'authentication/logout';
}
