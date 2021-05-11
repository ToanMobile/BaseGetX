import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wefinex/base/networking/api.dart';
import 'package:wefinex/base/networking/result.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'model/xoso_entity.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

///
/// --------------------------------------------
/// In this class where the [Function]s correspond to the API.
/// Which function here you will make it and you will consume it.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class Repositories {
  ApiService _service = ApiService();

  Future<List<XosoEntity>> getDataXoSo() async {
    final String assets = await rootBundle.loadString(Common().assetsImage.getListXoso);
    final listXoSo = List<XosoEntity>.from(json.decode(assets).map((x) => XosoEntity.fromJson(x)));
    return listXoSo;
  }

  Future<Result> getDataBongDa() async => await _service.getData(baseUrl: Common().myConfig.BASE_URL_BONGDA, endPoint: "v2/competitions", withToken: true);

  Future<Result> getDataCoin() async => await _service.getData(baseUrl: Common().myConfig.BASE_URL_COIN, endPoint: "data/top/mktcapfull?tsym=USD&limit=100");

  Future<Result> getListCoin() async => await _service.getData(endPoint: "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false");
}
