import 'package:login_sample_app/common/common_export.dart';

class UserTypeHelper {
  static UserType getUserType(String userType) {
    switch (userType) {
      case 'passenger':
        return UserType.passenger;
      case 'tourguide':
        return UserType.tourGuide;
      default:
        return UserType.passenger;
    }
  }

  static String getUserTypeString(UserType userType) {
    switch (userType) {
      case UserType.passenger:
        return 'passenger';
      case UserType.tourGuide:
        return 'tourguide';
    }
  }
}
