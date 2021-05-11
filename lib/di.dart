import 'package:get/get.dart';

import 'services/services.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
}
