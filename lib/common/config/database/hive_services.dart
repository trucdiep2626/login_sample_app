import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_sample_app/common/config/database/local_key.dart';

class HiveServices {
  late Box<dynamic> hiveBox;
  late Box<dynamic> searchKeywordBox;
  late Box<dynamic> viewedProductsBox;

  Future<void> init() async {
    await Hive.initFlutter();

    hiveBox = await Hive.openBox(LocalStorageKey.boxKey);

    searchKeywordBox = await Hive.openBox(LocalStorageKey.searchKeyword);

    viewedProductsBox = await Hive.openBox(LocalStorageKey.viewedProducts);
  }

  void dispose() {
    viewedProductsBox.compact();
    searchKeywordBox.compact();
    hiveBox.compact();
    Hive.close();
  }
}
