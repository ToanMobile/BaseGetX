import 'package:flutter/material.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'home_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class HomeScreen extends BaseView<HomeController> {
  @override
  Widget vBuilder() => Scaffold(
        body: _body(),
      );

  _body() {
    print("filteredMarketData==" + (controller.listData?.length ?? 0).toString());
    if (controller.screenStateIsLoading) return Center(child: CircularProgressIndicator());
    if (controller.screenStateIsError) return Text(Common().string.error_message);
    if (controller.screenStateIsOK) return buildWidgetMarket();
  }

  buildWidgetMarket() => controller.listData?.length == 0
      ? Container()
      : Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    Common().string.coin_rank,
                    style: Common().textStyle.styleBold12Black,
                  ),
                  Text(
                    Common().string.coin_name,
                    style: Common().textStyle.styleBold12Black,
                  ),
                  Text(
                    Common().string.coin_symbol,
                    style: Common().textStyle.styleBold12Black,
                  ),
                  Text(
                    Common().string.coin_price,
                    style: Common().textStyle.styleBold12Black,
                  ),
                  Text(
                    Common().string.coin_change_1h,
                    style: Common().textStyle.styleBold12Black,
                  ),
                ],
              ),
              ListView.builder(
                itemCount: controller.listData?.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = controller.listData![index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Card(
                      child: Row(
                        children: [
                          buildWidgetTitleRank(item.marketCapRank.toString()),
                          buildWidgetNameRank(item.name.toString(), item.image.toString()),
                          buildWidgetSymbolRank(item.symbol.toString()),
                          buildWidgetPrice(item.currentPrice.toString()),
                          buildWidgetChange1h(item.priceChangePercentage24h.toString()),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );

  buildWidgetTitleRank(String title) => Text(
        title,
        style: Common().textStyle.styleRegular12Black,
      );

  buildWidgetNameRank(String name, String icon) => Row(
        children: [
          Image.network(icon),
          Text(
            name,
            style: Common().textStyle.styleRegular12Black,
          )
        ],
      );

  buildWidgetSymbolRank(String symbol) => Text(
        symbol,
        style: Common().textStyle.styleRegular12Black,
      );

  buildWidgetPrice(String price) => Text(
        price,
        style: Common().textStyle.styleRegular12Black,
      );

  buildWidgetChange1h(String price1h) => Text(
        price1h,
        style: Common().textStyle.styleRegular12Black,
      );
}
