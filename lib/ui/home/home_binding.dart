import 'dart:convert';

import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/coin_entity.dart';
import 'package:wefinex/shared/constant/common.dart';

/*
Created by ToanDev on 05/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends BaseController {
  List<CoinEntity>? listData;

  @override
  void onInit() async {
    super.onInit();
    onGetListCoin();
    logWhenDebug("CURRENT listCoin: ", listData.toString());
  }

  Future<void> onGetListCoin() async {
    setScreenState = screenStateLoading;
    final res = await getListCoin();
    String text = '';
    if (res.status == true) {
      try {
        logWhenDebug("x===", res.body.toString());
        jsonDecode(res.body).map((x) {
          logWhenDebug("x===", x.toString());
        });
        listData = List<CoinEntity>.from(json.decode(res.body).map((x) => CoinEntity.fromJson(x)));
        logWhenDebug("listData===", listData.toString());
        setScreenState = screenStateOk;
      } catch (e) {
        text = e.toString();
      }
    } else {
      text = res.text ?? Common().string.error_message;
      setScreenState = screenStateError;
    }
    if (res.isError == true) {
      text = Common().string.error_message;
      setScreenState = screenStateError;
    }
    if (text.isNotEmpty) {
      showSnackBar(title: "Response", message: text);
    }
    update();
  }
}