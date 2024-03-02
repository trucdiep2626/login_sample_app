import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_sample_app/common/config/database/hive_services.dart';

class LocalRepository {
  final FlutterSecureStorage prefs;

  LocalRepository({
    required this.prefs,
  });

  Future saveSecureData({required String key, dynamic value}) async {
    await prefs.write(key: key, value: value);

    final result = getSecureData(key: key);
  }

  Future<String?> getSecureData({required String key}) async {
    try {
      return await prefs.read(key: key);
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteAllSecureData() async {
    await prefs.deleteAll();
  }

  Future<void> deleteSecureData({required String key}) async {
    await prefs.delete(key: key);
  }
}
