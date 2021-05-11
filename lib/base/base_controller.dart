import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wefinex/shared/utils/utilities.dart';

import '../repository/repositories.dart';
import 'base_common_widgets.dart';
import 'widget_state.dart';

export 'package:get/get.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

///
/// --------------------------------------------
/// [Example]
///
/// class HomeController extends BaseController {
///
///   var count = 0.obs;
///
///   @override
///   void onInit() {
///     super.onInit();
///   }
///
///   void increment() => count ++;
///
/// }
///
/// RECOMENDED FOR your [Controller].
/// Please extends to your [Controller].
/// read the [Example] above.

class BaseController extends GetxController with BaseCommonWidgets, Utilities, Repositories, WidgetState, ScreenState {
  final box = GetStorage();
  bool isLoadMore = false;
  bool withScrollController = false;
  ScrollController? scrollController;

  set setEnableScrollController(bool value) => withScrollController = value;

  @override
  void onInit() {
    super.onInit();
    if (withScrollController) {
      logWhenDebug("SCROLL CONTROLLER ENABLE on ${Get.currentRoute}", withScrollController.toString());
      scrollController = ScrollController();
      scrollController?.addListener(_scrollListener);
    }
  }

  void onRefresh() {}

  void onLoadMore() {}

  void _scrollListener() {
    if (scrollController != null) {
      if ((scrollController?.offset ?? 0) >= (scrollController?.position.maxScrollExtent ?? 0) && scrollController?.position.outOfRange == false) {
        if (!isLoadMore) {
          isLoadMore = true;
          update();
          onLoadMore();
        }
      }
    }
    _innerBoxScrolled();
  }

  void _innerBoxScrolled() {
    if ((scrollController?.offset ?? 0) <= 60 && (scrollController?.offset ?? 0) > 40) {
      // if(!innerBoxIsScrolled) {
      //   innerBoxIsScrolled = true;
      //   update();
      // }
    }
    if ((scrollController?.offset ?? 0) >= 0 && (scrollController?.offset ?? 0) <= 40) {
      // if(innerBoxIsScrolled) {
      //   innerBoxIsScrolled = false;
      //   update();
      // }
    }
  }
}
