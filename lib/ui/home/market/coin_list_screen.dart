import 'package:flutter/material.dart';
import 'package:wefinex/base/base_controller.dart';
import 'package:wefinex/repository/model/coin_entity.dart';
import 'package:wefinex/routes/app_pages.dart';
import 'package:wefinex/shared/utils/market_utils.dart';

import 'coin_details.dart';

class CoinListItem extends StatelessWidget {
 // CoinListItem(this.snapshot, this.columnProps);

  _getImage() {
   /* if (assetImages.contains(snapshot["CoinInfo"]["Name"].toLowerCase())) {
      return Image.asset("assets/images/" + snapshot["CoinInfo"]["Name"].toLowerCase() + ".png", height: 28.0);
    } else {
      return Container();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  /*  if (!snapshot.containsKey("CoinInfo") || !snapshot.containsKey("RAW") || snapshot == null || snapshot.isEmpty) {
      return Container();
    }*/

   /* return InkWell(
        onTap: () => Get.toNamed(Routes.COIN_DETAILS, arguments: snapshot),
        child: Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * columnProps[0],
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(snapshot["rank"].toString(), style: Theme.of(context).textTheme.bodyText1!.apply(fontWeightDelta: 2)),
                    Padding(padding: const EdgeInsets.only(right: 7.0)),
                    _getImage(),
                    Padding(padding: const EdgeInsets.only(right: 7.0)),
                    Text(snapshot["CoinInfo"]["Name"], style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * columnProps[1],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("\$" + MarketUtil.normalizeNum(snapshot["RAW"]["USD"]["MKTCAP"]), style: Theme.of(context).textTheme.bodyText1),
                      Padding(padding: const EdgeInsets.only(bottom: 4.0)),
                      Text("\$" + MarketUtil.normalizeNum(snapshot["RAW"]["USD"]["TOTALVOLUME24H"]),
                          style: Theme.of(context).textTheme.bodyText1!.apply(color: Theme.of(context).hintColor))
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * columnProps[2],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("\$" + MarketUtil.normalizeNumNoCommas(snapshot["RAW"]["USD"]["PRICE"])),
                    Padding(padding: const EdgeInsets.only(bottom: 4.0)),
                    Text(
                        (snapshot["RAW"]["USD"]["CHANGEPCT24HOUR"] ?? 0) >= 0
                            ? "+" + (snapshot["RAW"]["USD"]["CHANGEPCT24HOUR"] ?? 0).toStringAsFixed(2) + "%"
                            : (snapshot["RAW"]["USD"]["CHANGEPCT24HOUR"] ?? 0).toStringAsFixed(2) + "%",
                        style: Theme.of(context).primaryTextTheme.bodyText2!.apply(color: (snapshot["RAW"]["USD"]["CHANGEPCT24HOUR"] ?? 0) >= 0 ? Colors.green : Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ));*/
  }
}
