import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_us.dart';
import 'vi_VN.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'vi_VN': vi_VN,
      };
}
