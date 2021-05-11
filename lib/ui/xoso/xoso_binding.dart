import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class XoSoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XoSoController());
  }
}

class XoSoController extends BaseController {
  var listData;

  @override
  void onInit() async {
    super.onInit();
    onGetListXoSo();
    logWhenDebug("CURRENT listXoso : ", listData.toString());
  }

  void onGetListXoSo() async {
    setScreenState = screenStateLoading;
    listData = await getDataXoSo();
    setScreenState = screenStateOk;
    update();
  }
}
