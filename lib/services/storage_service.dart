import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  Future<bool> init() async {
    return await GetStorage.init();
  }
}
