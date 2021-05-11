import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/shared/constant/common.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BottomNavigationViewController extends BaseController {
  // Fields
  RxInt _currentNavPageIndex = 0.obs;

  late List<BottomNavigationBarItem> _bottomNavigationBarItems;

  int get currentNavPageIndex => _currentNavPageIndex.value;
  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      _bottomNavigationBarItems;

  // Setters
  set currentNavPageIndex(int value) {
    _currentNavPageIndex.value = value;
  }

  // Initialisation - LifeCycle
  @override
  void onInit() async {
    super.onInit();

    _bottomNavigationBarItems = populateNavBar(withHeight: 36.0);
  }

  // Methods

  List<BottomNavigationBarItem> populateNavBar({double? withHeight}) {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Common().assetsImage.icon_bottom_home,
          width: withHeight,
          height: withHeight,
        ),
        label: Common().string.coin,
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Common().assetsImage.icon_bottom_soxo,
          width: withHeight,
          height: withHeight,
        ),
        label: Common().string.xoso,
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Common().assetsImage.icon_bottom_bongda,
          width: withHeight,
          height: withHeight,
        ),
        label: Common().string.xoso,
        backgroundColor: Colors.white,
      ),
    ];
  }
}
