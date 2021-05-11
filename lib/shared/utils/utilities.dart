import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:wefinex/shared/constant/common.dart';

/// Created by daewubintara on
/// 09, September 2020 11.03

///
/// --------------------------------------------
/// There are many amazing [Function]s in this class.
/// Especialy in [Function]ality.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class Utilities {
  void logWhenDebug(String tag,String message){
    if (kDebugMode) log("$tag => ${message.toString()}", name: Common().myConfig.APP_NAME);
  }
}