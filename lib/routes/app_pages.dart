import 'package:get/get.dart';
import 'package:wefinex/ui/bottom_nav_view/bottom_navigation_binding.dart';
import 'package:wefinex/ui/bottom_nav_view/bottom_navigation_view.dart';
import 'package:wefinex/ui/home/home_binding.dart';
import 'package:wefinex/ui/home/home_screen.dart';
import 'package:wefinex/ui/home/market/coin_details.dart';
import 'package:wefinex/ui/home/market/coin_list_screen.dart';
import 'package:wefinex/ui/webview/webview_screen.dart';
import 'package:wefinex/ui/xoso/xoso_binding.dart';
import 'package:wefinex/ui/xoso/xoso_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.COIN,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      children: [
        /*GetPage(
          name: Routes.COIN_LIST,
          page: () => CoinListItem(),
          children: [
            GetPage(
              name: Routes.COIN_DETAILS,
              page: () => CoinDetails(),
            ),
          ],
        ),*/
        GetPage(
          name: Routes.COIN_DETAILS,
          page: () => CoinDetails(),
        ),
      ],
    ),
    GetPage(
      name: Routes.SO_XO,
      page: () => XoSoScreen(),
      binding: XoSoBinding(),
    ),
    GetPage(
      name: Routes.WEB_VIEW,
      page: () => WebViewScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
  ];
}
