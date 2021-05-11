import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class Common {
  _String string = _String();
  _AssetsImage assetsImage = _AssetsImage();
  _Color color = _Color();
  _MyConfig myConfig = _MyConfig();
  _Storage storage = _Storage();
  _Dimen dimen = _Dimen();
  _TextStyle textStyle = _TextStyle();
}

class _AssetsImage {
  static const String images = 'assets/images/';
  static const String icons = 'assets/icons/';
  String img_logo = images + 'img_logo.png';
  String icon_bottom_home = icons + 'settings_icon.svg';
  String icon_bottom_soxo = icons + 'settings_icon.svg';
  String icon_bottom_bongda = icons + 'settings_icon.svg';

  //Screen Soxo
  String icon_soxo_path = icons;
  String icon_soxo = icons + 'soxo.webp';

  //Get data Xoso
  String getListXoso = 'assets/json/soxo.json';
}

class _String {
  String title_app = 'title_app'.tr;
  String coin = 'coin'.tr;
  String xoso = 'xoso'.tr;
  String error_message = 'error_message'.tr;
  String currency = 'currency'.tr;
  String market_cap = 'market_cap'.tr;
  String total_market_cap = 'total_market_cap'.tr;
  String total_24h_volume = 'total_24h_volume'.tr;
  String price_24h = 'price_24h'.tr;
  String bottom_stats = 'bottom_stats'.tr;
  String bottom_markets = 'bottom_markets'.tr;
  String bottom_transactions = 'bottom_transactions'.tr;
  String bottom_aggregate = 'bottom_aggregate'.tr;
  String coin_rank = 'coin_rank'.tr;
  String coin_name = 'coin_name'.tr;
  String coin_symbol = 'coin_symbol'.tr;
  String coin_market_cap = 'coin_market_cap'.tr;
  String coin_price = 'coin_price'.tr;
  String coin_circulating = 'coin_circulating'.tr;
  String coin_volume = 'coin_volume'.tr;
  String coin_change_1h = 'coin_change_1h'.tr;
  String coin_change_24h = 'coin_change_24h'.tr;
  String coin_change_7d = 'coin_change_7d'.tr;
}

class _Storage {
  final String token = 'token';
  final String userInfo = 'userInfo';
  final String theme = 'darkMode';
}

class _Color {
  Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  Color secondaryAppColor = hexToColor('#22DDA6');
  Color secondaryDarkAppColor = Colors.white;
  Color tipColor = hexToColor('#B6B6B6');
  Color lightGray = Color(0xFFF6F6F6);
  Color darkGray = Color(0xFF9F9F9F);
  Color black = Color(0xFF000000);
  Color white = Color(0xFFFFFFFF);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex), 'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class _Dimen {
  final double margin_0 = 0.0;
  final double margin_4 = 4.0;
  final double margin_8 = 8.0;
  final double margin_10 = 10.0;
  final double margin_12 = 12.0;
  final double margin_16 = 16.0;
  final double margin_20 = 20.0;
  final double margin_24 = 24.0;
  final double margin_30 = 30.0;
}

class _TextStyle {
  final styleRegular10White = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  final styleRegular12White = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  final styleRegular12Black = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  final styleBold12Black = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  final styleRegular16Black = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );

  final styleBold18White = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  final styleBold18Black = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}

class _MyConfig {
  /// APP CONFIG
  final String APP_NAME = "-- WEFINEX --";
  final String BASE_URL_XOSO = "https://xskt.com.vn/rss-feed/";
  final String BASE_URL_BONGDA = "https://api.football-data.org/";
  final String BASE_URL_GITHUB = "https://api.github.com/";
  final String BASE_URL_COIN_OLD = "https://min-api.cryptocompare.com/";
  final String BASE_URL_COIN = "https://api.coingecko.com/api/v3/";
  final String TOKEN_STRING_KEY = '1e6002e19a5144a387916a5129045c12';
  /// CUSTOM CONFIG APP
  final String LANGUAGE = 'LANGUAGE';
}
