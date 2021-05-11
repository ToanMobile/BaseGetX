import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefinex/shared/constant/common.dart';

class CoinDetails extends StatefulWidget {

  @override
  CoinDetailsState createState() => CoinDetailsState();
}

class CoinDetailsState extends State<CoinDetails> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _tabAmt;
  late List<Widget> _tabBarChildren;
  late String symbol;
  Map? snapshot;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bool enableTransactions = false;

  _makeTabs() {
    if (enableTransactions) {
      _tabAmt = 3;
      _tabBarChildren = [Tab(text: Common().string.bottom_stats), Tab(text: Common().string.bottom_markets), Tab(text: Common().string.bottom_transactions)];
    } else {
      _tabAmt = 2;
      _tabBarChildren = [Tab(text: Common().string.bottom_aggregate), Tab(text: Common().string.bottom_markets)];
    }
  }

  @override
  void initState() {
    super.initState();
    _makeTabs();
    _tabController = TabController(length: _tabAmt, vsync: this);
    snapshot = Get.arguments;
    symbol = snapshot?["CoinInfo"]["Name"];
/*
    _makeGeneralStats();
    if (historyOHLCV == null) {
      changeHistory(historyType, historyAmt, historyTotal, historyAgg);
    }
    if (exchangeData == null) {
      _getExchangeData();
    }

    _refreshTransactions();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 2.0,
          elevation: appBarElevation,
          title: Text(widget.snapshot["CoinInfo"]["FullName"], style: Theme.of(context).textTheme.headline6),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(25.0),
              child: Container(
                  height: 30.0,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Theme.of(context).accentIconTheme.color,
                    indicatorWeight: 2.0,
                    unselectedLabelColor: Theme.of(context).disabledColor,
                    labelColor: Theme.of(context).primaryIconTheme.color,
                    tabs: _tabBarChildren,
                  ))),
          actions: <Widget>[
            enableTransactions
                ? IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
                        return TransactionSheet(() {
                          setState(() {
                            _refreshTransactions();
                          });
                        }, marketListData);
                      });
                    })
                : Container(),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: enableTransactions ? [aggregateStats(context), exchangeListPage(context), transactionPage(context)] : [aggregateStats(context), exchangeListPage(context)],
      ),*/
    );
  }

 /* Map? generalStats;
  List? historyOHLCV;

  String _high = "0";
  String _low = "0";
  String _change = "0";

  int currentOHLCVWidthSetting = 0;
  String historyAmt = "720";
  String historyType = "minute";
  String historyTotal = "24h";
  String historyAgg = "2";

  _getGeneralStats() async {
    const int fifteenMin = 15 * 60 * 1000;
    if (lastUpdate != null && fifteenMin != null && DateTime.now().millisecondsSinceEpoch - lastUpdate >= fifteenMin) {
      await getMarketData();
    }
    _makeGeneralStats();
  }

  _makeGeneralStats() {
    for (Map coin in marketListData) {
      if (coin["CoinInfo"]["Name"] == symbol) {
        generalStats = coin["RAW"]["USD"];
        break;
      }
    }
  }

  Future<Null> getHistoryOHLCV() async {
    var response = await http.get(
        Uri.tryParse("https://min-api.cryptocompare.com/data/histo" +
            ohlcvWidthOptions[historyTotal][currentOHLCVWidthSetting][3] +
            "?fsym=" +
            symbol +
            "&tsym=USD&limit=" +
            (ohlcvWidthOptions[historyTotal][currentOHLCVWidthSetting][1] - 1).toString() +
            "&aggregate=" +
            ohlcvWidthOptions[historyTotal][currentOHLCVWidthSetting][2].toString()),
        headers: {"Accept": "application/json"});
    setState(() {
      historyOHLCV = JsonDecoder().convert(response.body)["Data"];
      if (historyOHLCV == null) {
        historyOHLCV = [];
      }
    });
  }

  Future<Null> changeOHLCVWidth(int currentSetting) async {
    currentOHLCVWidthSetting = currentSetting;
    historyOHLCV = null;
    getHistoryOHLCV();
  }

  _getHL() {
    num highReturn = -double.infinity;
    num lowReturn = double.infinity;

    for (var i in historyOHLCV) {
      if (i["high"] > highReturn) {
        highReturn = i["high"].toDouble();
      }
      if (i["low"] < lowReturn) {
        lowReturn = i["low"].toDouble();
      }
    }

    _high = normalizeNumNoCommas(highReturn);
    _low = normalizeNumNoCommas(lowReturn);

    var start = historyOHLCV[0]["open"] == 0 ? 1 : historyOHLCV[0]["open"];
    var end = historyOHLCV.last["close"];
    var changePercent = (end - start) / start * 100;
    _change = changePercent.toStringAsFixed(2);
  }

  Future<Null> changeHistory(String type, String amt, String total, String agg) async {
    setState(() {
      _high = "0";
      _low = "0";
      _change = "0";

      historyAmt = amt;
      historyType = type;
      historyTotal = total;
      historyAgg = agg;

      historyOHLCV = null;
    });
    _getGeneralStats();
    await getHistoryOHLCV();
    _getHL();
  }

  Widget aggregateStats(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("\$" + (generalStats != null ? normalizeNumNoCommas(generalStats["PRICE"]) : "0"), style: Theme.of(context).textTheme.body2.apply(fontSizeFactor: 2.2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("market_cap".tr, style: Theme.of(context).textTheme.caption.apply(color: Theme.of(context).hintColor)),
                        Padding(padding: const EdgeInsets.symmetric(vertical: 2.0)),
                        Text("24h_volume".tr, style: Theme.of(context).textTheme.caption.apply(color: Theme.of(context).hintColor)),
                      ],
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(generalStats != null ? "\$" + normalizeNum(generalStats["MKTCAP"]) : "0",
                            style: Theme.of(context).textTheme.body2.apply(fontSizeFactor: 1.1, fontWeightDelta: 2)),
                        Text(generalStats != null ? "\$" + normalizeNum(generalStats["TOTALVOLUME24H"]) : "0",
                            style: Theme.of(context).textTheme.body2.apply(fontSizeFactor: 1.1, fontWeightDelta: 2, color: Theme.of(context).hintColor)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("period".tr, style: Theme.of(context).textTheme.body1.apply(color: Theme.of(context).hintColor)),
                                      Padding(padding: const EdgeInsets.only(right: 3.0)),
                                      Text(historyTotal, style: Theme.of(context).textTheme.body2.apply(fontWeightDelta: 2)),
                                      Padding(padding: const EdgeInsets.only(right: 4.0)),
                                      historyOHLCV != null
                                          ? Text(num.parse(_change) > 0 ? "+" + _change + "%" : _change + "%",
                                              style: Theme.of(context).primaryTextTheme.body2.apply(color: num.parse(_change) >= 0 ? Colors.green : Colors.red))
                                          : Container()
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text("candle_width".tr, style: Theme.of(context).textTheme.body1.apply(color: Theme.of(context).hintColor)),
                                      Padding(padding: const EdgeInsets.only(right: 2.0)),
                                      Text(ohlcvWidthOptions[historyTotal][currentOHLCVWidthSetting][0], style: Theme.of(context).textTheme.body2.apply(fontWeightDelta: 2))
                                    ],
                                  ),
                                ],
                              ),
                              historyOHLCV != null
                                  ? Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("high".tr, style: Theme.of(context).textTheme.body1.apply(color: Theme.of(context).hintColor)),
                                            Text("low".tr, style: Theme.of(context).textTheme.body1.apply(color: Theme.of(context).hintColor)),
                                          ],
                                        ),
                                        Padding(padding: const EdgeInsets.symmetric(horizontal: 1.5)),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text("\$" + _high, style: Theme.of(context).textTheme.body2),
                                            Text("\$" + _low, style: Theme.of(context).textTheme.body2)
                                          ],
                                        ),
                                      ],
                                    )
                                  : Container()
                            ],
                          ),
                        ],
                      )),
                ),
                Container(
                    child: PopupMenuButton(
                  tooltip: "select_width".tr,
                  icon: Icon(Icons.swap_horiz, color: Theme.of(context).buttonColor),
                  itemBuilder: (BuildContext context) {
                    List<PopupMenuEntry<dynamic>> options = [];
                    for (int i = 0; i < ohlcvWidthOptions[historyTotal].length; i++) {
                      options.add(PopupMenuItem(child: Text(ohlcvWidthOptions[historyTotal][i][0]), value: i));
                    }
                    return options;
                  },
                  onSelected: (result) {
                    changeOHLCVWidth(result);
                  },
                )),
                Container(
                    child: PopupMenuButton(
                  tooltip: "select_period".tr,
                  icon: Icon(Icons.access_time, color: Theme.of(context).buttonColor),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(child: Text("1h"), value: ["minute", "60", "1h", "1"]),
                    PopupMenuItem(child: Text("6h"), value: ["minute", "360", "6h", "1"]),
                    PopupMenuItem(child: Text("12h"), value: ["minute", "720", "12h", "1"]),
                    PopupMenuItem(child: Text("24h"), value: ["minute", "720", "24h", "2"]),
                    PopupMenuItem(child: Text("3D"), value: ["hour", "72", "3D", "1"]),
                    PopupMenuItem(child: Text("7D"), value: ["hour", "168", "7D", "1"]),
                    PopupMenuItem(child: Text("1M"), value: ["hour", "720", "1M", "1"]),
                    PopupMenuItem(child: Text("3M"), value: ["day", "90", "3M", "1"]),
                    PopupMenuItem(child: Text("6M"), value: ["day", "180", "6M", "1"]),
                    PopupMenuItem(child: Text("1Y"), value: ["day", "365", "1Y", "1"]),
                  ],
                  onSelected: (result) {
                    changeHistory(result[0], result[1], result[2], result[3]);
                  },
                )),
              ],
            ),
          ),
          Flexible(
            child: historyOHLCV != null
                ? Container(
                    padding: const EdgeInsets.only(left: 2.0, right: 1.0, top: 10.0),
                    child: historyOHLCV.isEmpty != true
                        ? OHLCVGraph(
                            data: historyOHLCV,
                            enableGridLines: true,
                            gridLineColor: Theme.of(context).dividerColor,
                            gridLineLabelColor: Theme.of(context).hintColor,
                            gridLineAmount: 4,
                            volumeProp: 0.2,
                            lineWidth: 1.0,
                            decreaseColor: Colors.red[600],
                          )
                        : Container(
                            padding: const EdgeInsets.all(30.0),
                            alignment: Alignment.topCenter,
                            child: Text("No OHLCV data found :(", style: Theme.of(context).textTheme.caption),
                          ),
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          )
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        elevation: appBarElevation,
        child: generalStats != null
            ? QuickPercentChangeBar(snapshot: generalStats)
            : Container(
                height: 0.0,
              ),
      ),
    );
  }

  final columnProps = [.3, .3, .25];
  List exchangeData;

  Future<Null> _getExchangeData() async {
    var response =
        await http.get(Uri.tryParse("https://min-api.cryptocompare.com/data/top/exchanges/full?fsym=" + symbol + "&tsym=USD&limit=1000"), headers: {"Accept": "application/json"});

    if (JsonDecoder().convert(response.body)["Response"] != "Success") {
      setState(() {
        exchangeData = [];
      });
    } else {
      exchangeData = JsonDecoder().convert(response.body)["Data"]["Exchanges"];
      _sortExchangeData();
    }
  }

  List sortType = ["VOLUME24HOURTO", true];

  void _sortExchangeData() {
    List sortedExchangeData = [];
    for (var i in exchangeData) {
      if (i["VOLUME24HOURTO"] > 1000) {
        sortedExchangeData.add(i);
      }
    }

    if (sortType[1]) {
      sortedExchangeData.sort((a, b) => b[sortType[0]].compareTo(a[sortType[0]]));
    } else {
      sortedExchangeData.sort((a, b) => a[sortType[0]].compareTo(b[sortType[0]]));
    }

    setState(() {
      exchangeData = sortedExchangeData;
    });
  }

  Widget exchangeListPage(BuildContext context) {
    return exchangeData != null
        ? RefreshIndicator(
            onRefresh: () => _getExchangeData(),
            child: exchangeData.isEmpty != true
                ? CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                          delegate: SliverChildListDelegate(<Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1.0))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  if (sortType[0] == "MARKET") {
                                    sortType[1] = !sortType[1];
                                  } else {
                                    sortType = ["MARKET", false];
                                  }
                                  setState(() {
                                    _sortExchangeData();
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  width: MediaQuery.of(context).size.width * columnProps[0],
                                  child: sortType[0] == "MARKET"
                                      ? Text(sortType[1] == true ? "Exchange $upArrow" : "Exchange $downArrow", style: Theme.of(context).textTheme.body2)
                                      : Text(
                                          "Exchange",
                                          style: Theme.of(context).textTheme.body2.apply(color: Theme.of(context).hintColor),
                                        ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (sortType[0] == "VOLUME24HOURTO") {
                                    sortType[1] = !sortType[1];
                                  } else {
                                    sortType = ["VOLUME24HOURTO", true];
                                  }
                                  setState(() {
                                    _sortExchangeData();
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width * columnProps[1],
                                  child: sortType[0] == "VOLUME24HOURTO"
                                      ? Text(sortType[1] == true ? "${"24h_volume".tr} $downArrow" : "${"24h_volume".tr} $upArrow", style: Theme.of(context).textTheme.body2)
                                      : Text("24h_volume".tr, style: Theme.of(context).textTheme.body2.apply(color: Theme.of(context).hintColor)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * columnProps[2],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        if (sortType[0] == "PRICE") {
                                          sortType[1] = !sortType[1];
                                        } else {
                                          sortType = ["PRICE", true];
                                        }
                                        setState(() {
                                          _sortExchangeData();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: sortType[0] == "PRICE"
                                            ? Text(sortType[1] == true ? "${'price'.tr} $downArrow" : "${'price'.tr} $upArrow", style: Theme.of(context).textTheme.body2)
                                            : Text('price'.tr, style: Theme.of(context).textTheme.body2.apply(color: Theme.of(context).hintColor)),
                                      ),
                                    ),
                                    Text("/", style: Theme.of(context).textTheme.body2.apply(color: Theme.of(context).hintColor)),
                                    InkWell(
                                      onTap: () {
                                        if (sortType[0] == "CHANGEPCT24HOUR") {
                                          sortType[1] = !sortType[1];
                                        } else {
                                          sortType = ["CHANGEPCT24HOUR", true];
                                        }
                                        setState(() {
                                          _sortExchangeData();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: sortType[0] == "CHANGEPCT24HOUR"
                                            ? Text(sortType[1] ? "24h $downArrow" : "24h $upArrow", style: Theme.of(context).textTheme.body2)
                                            : Text("24h", style: Theme.of(context).textTheme.body2.apply(color: Theme.of(context).hintColor)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => ExchangeListItem(exchangeData[index], columnProps),
                        childCount: exchangeData == null ? 0 : exchangeData.length,
                      ))
                    ],
                  )
                : CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                          delegate: SliverChildListDelegate(<Widget>[
                        Container(
                          padding: const EdgeInsets.all(30.0),
                          alignment: Alignment.topCenter,
                          child: Text("No exchanges found :(", style: Theme.of(context).textTheme.caption),
                        )
                      ]))
                    ],
                  ))
        : Container(
            child: Center(child: CircularProgressIndicator()),
          );
  }

  num value;
  num cost;
  num holdings;
  num net;
  num netPercent;
  List transactionList;

  _refreshTransactions() {
    _sortTransactions();
    _updateTotals();
  }

  _updateTotals() {
    value = 0;
    cost = 0;
    holdings = 0;
    net = 0;
    netPercent = 0;

    for (Map transaction in transactionList) {
      cost += transaction["quantity"] * transaction["price_usd"];
      value += transaction["quantity"] * generalStats["PRICE"];
      holdings += transaction["quantity"];
    }

    net = value - cost;

    if (cost > 0) {
      netPercent = ((value - cost) / cost) * 100;
    } else {
      netPercent = 0.0;
    }
  }

  _sortTransactions() {
    if (portfolioMap[symbol] == null) {
      transactionList = [];
    } else {
      transactionList = portfolioMap[symbol];
      transactionList.sort((a, b) => (b["time_epoch"].compareTo(a["time_epoch"])));
    }
  }

  Widget transactionPage(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("total_value".tr, style: Theme.of(context).textTheme.caption),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("\$" + numCommaParse(value.toStringAsFixed(2)), style: Theme.of(context).textTheme.body2.apply(fontSizeFactor: 2.2)),
                      ],
                    ),
                    Text(num.parse(holdings.toStringAsPrecision(9)).toString() + " " + symbol, style: Theme.of(context).textTheme.body2.apply(fontSizeFactor: 1.2)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("total_net".tr, style: Theme.of(context).textTheme.caption),
                    PercentDollarChange(
                      exact: net,
                      percent: netPercent,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("total_cost".tr, style: Theme.of(context).textTheme.caption),
                    Text("\$" + numCommaParse(cost.toStringAsFixed(2)), style: Theme.of(context).primaryTextTheme.body2.apply(fontSizeFactor: 1.5))
                  ],
                ),
              ],
            ),
          ),
        ])),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => TransactionItem(
                      snapshot: transactionList[index],
                      currentPrice: generalStats["PRICE"],
                      symbol: symbol,
                      refreshPage: () {
                        setState(() {
                          _refreshTransactions();
                        });
                      },
                    ),
                childCount: transactionList.length)),
      ],
    );
  }*/
}
