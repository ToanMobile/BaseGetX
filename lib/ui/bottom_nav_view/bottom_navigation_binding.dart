import 'package:get/get.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/ui/home/home_binding.dart';
import 'package:wefinex/ui/xoso/xoso_binding.dart';
import 'bottom_navigation_view_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationViewController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => XoSoController());
  }
}