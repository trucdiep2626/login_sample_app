import 'package:login_sample_app/data/local_repository.dart';

class LocalUseCase {
  LocalRepository localRepo;

  LocalUseCase({required this.localRepo});

  // dynamic getLocalValue({required String key}) =>
  //     localRepo.getLocalValue(key: key);
  //
  // Future<void> setLocalValue({required String key, dynamic value}) async {
  //   return await localRepo.setLocalValue(key: key, value: value);
  // }


  Future saveSecureData({required String key, dynamic value}) async {
    await localRepo.saveSecureData(key: key, value: value);
  }

  Future<String?> getSecureData({required String key}) async {
    return await localRepo.getSecureData(key: key);
  }

  Future<void> deleteAllSecureData() async {
    await localRepo.deleteAllSecureData();
  }

}
