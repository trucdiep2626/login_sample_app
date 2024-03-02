import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:login_sample_app/common/config/network/app_network.dart';
import 'package:login_sample_app/data/account_repository.dart';
import 'package:login_sample_app/data/local_repository.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';

GetIt getIt = GetIt.instance;

void configLocator() {
  // /// Controllers
  // getIt.registerFactory<LoginController>(
  //         () => LoginController(accountUseCase: getIt<AccountUseCase>()));
  //

  ///helper

  /// UseCases
  getIt.registerFactory<AccountUseCase>(() => AccountUseCase(
    accountRepo: getIt<AccountRepository>(),
    localRepo: getIt<LocalRepository>(),
  ));

  /// Repositories
  getIt.registerFactory<AccountRepository>(() => AccountRepository(
    client: getIt<ApiClient>(),
  ));


  getIt.registerFactory<LocalRepository>(() => LocalRepository(
    prefs: getIt<FlutterSecureStorage>(),
  ));

  //db
  getIt.registerLazySingleton<FlutterSecureStorage>(
          () => const FlutterSecureStorage());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
}
