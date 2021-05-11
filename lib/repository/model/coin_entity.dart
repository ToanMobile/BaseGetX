/// id : "bitcoin"
/// symbol : "btc"
/// name : "Bitcoin"
/// image : "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
/// current_price : 58017
/// market_cap : 1085258241226
/// market_cap_rank : 1
/// fully_diluted_valuation : 1218366654825
/// total_volume : 65830648663
/// high_24h : 59578
/// low_24h : 56637
/// price_change_24h : 184.19
/// price_change_percentage_24h : 0.31849
/// market_cap_change_24h : 1457924529
/// market_cap_change_percentage_24h : 0.13452
/// circulating_supply : 18705718.0
/// total_supply : 21000000.0
/// max_supply : 21000000.0
/// ath : 64805
/// ath_change_percentage : -10.47341
/// ath_date : "2021-04-14T11:54:46.763Z"
/// atl : 67.81
/// atl_change_percentage : 85460.11703
/// atl_date : "2013-07-06T00:00:00.000Z"
/// roi : null
/// last_updated : "2021-05-10T09:59:53.950Z"

class CoinEntity {
  String? _id;
  String? _symbol;
  String? _name;
  String? _image;
  int? _currentPrice;
  int? _marketCap;
  int? _marketCapRank;
  int? _fullyDilutedValuation;
  int? _totalVolume;
  int? _high24h;
  int? _low24h;
  double? _priceChange24h;
  double? _priceChangePercentage24h;
  int? _marketCapChange24h;
  double? _marketCapChangePercentage24h;
  double? _circulatingSupply;
  double? _totalSupply;
  double? _maxSupply;
  int? _ath;
  double? _athChangePercentage;
  String? _athDate;
  double? _atl;
  double? _atlChangePercentage;
  String? _atlDate;
  dynamic? _roi;
  String? _lastUpdated;

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get image => _image;
  int? get currentPrice => _currentPrice;
  int? get marketCap => _marketCap;
  int? get marketCapRank => _marketCapRank;
  int? get fullyDilutedValuation => _fullyDilutedValuation;
  int? get totalVolume => _totalVolume;
  int? get high24h => _high24h;
  int? get low24h => _low24h;
  double? get priceChange24h => _priceChange24h;
  double? get priceChangePercentage24h => _priceChangePercentage24h;
  int? get marketCapChange24h => _marketCapChange24h;
  double? get marketCapChangePercentage24h => _marketCapChangePercentage24h;
  double? get circulatingSupply => _circulatingSupply;
  double? get totalSupply => _totalSupply;
  double? get maxSupply => _maxSupply;
  int? get ath => _ath;
  double? get athChangePercentage => _athChangePercentage;
  String? get athDate => _athDate;
  double? get atl => _atl;
  double? get atlChangePercentage => _atlChangePercentage;
  String? get atlDate => _atlDate;
  dynamic? get roi => _roi;
  String? get lastUpdated => _lastUpdated;

  CoinEntity({
      String? id, 
      String? symbol, 
      String? name, 
      String? image, 
      int? currentPrice, 
      int? marketCap, 
      int? marketCapRank, 
      int? fullyDilutedValuation, 
      int? totalVolume, 
      int? high24h, 
      int? low24h, 
      double? priceChange24h, 
      double? priceChangePercentage24h, 
      int? marketCapChange24h, 
      double? marketCapChangePercentage24h, 
      double? circulatingSupply, 
      double? totalSupply, 
      double? maxSupply, 
      int? ath, 
      double? athChangePercentage, 
      String? athDate, 
      double? atl, 
      double? atlChangePercentage, 
      String? atlDate, 
      dynamic? roi, 
      String? lastUpdated}){
    _id = id;
    _symbol = symbol;
    _name = name;
    _image = image;
    _currentPrice = currentPrice;
    _marketCap = marketCap;
    _marketCapRank = marketCapRank;
    _fullyDilutedValuation = fullyDilutedValuation;
    _totalVolume = totalVolume;
    _high24h = high24h;
    _low24h = low24h;
    _priceChange24h = priceChange24h;
    _priceChangePercentage24h = priceChangePercentage24h;
    _marketCapChange24h = marketCapChange24h;
    _marketCapChangePercentage24h = marketCapChangePercentage24h;
    _circulatingSupply = circulatingSupply;
    _totalSupply = totalSupply;
    _maxSupply = maxSupply;
    _ath = ath;
    _athChangePercentage = athChangePercentage;
    _athDate = athDate;
    _atl = atl;
    _atlChangePercentage = atlChangePercentage;
    _atlDate = atlDate;
    _roi = roi;
    _lastUpdated = lastUpdated;
}

  CoinEntity.fromJson(dynamic json) {
    _id = json["id"];
    _symbol = json["symbol"];
    _name = json["name"];
    _image = json["image"];
    _currentPrice = json["current_price"];
    _marketCap = json["market_cap"];
    _marketCapRank = json["market_cap_rank"];
    _fullyDilutedValuation = json["fully_diluted_valuation"];
    _totalVolume = json["total_volume"];
    _high24h = json["high_24h"];
    _low24h = json["low_24h"];
    _priceChange24h = json["price_change_24h"];
    _priceChangePercentage24h = json["price_change_percentage_24h"];
    _marketCapChange24h = json["market_cap_change_24h"];
    _marketCapChangePercentage24h = json["market_cap_change_percentage_24h"];
    _circulatingSupply = json["circulating_supply"];
    _totalSupply = json["total_supply"];
    _maxSupply = json["max_supply"];
    _ath = json["ath"];
    _athChangePercentage = json["ath_change_percentage"];
    _athDate = json["ath_date"];
    _atl = json["atl"];
    _atlChangePercentage = json["atl_change_percentage"];
    _atlDate = json["atl_date"];
    _roi = json["roi"];
    _lastUpdated = json["last_updated"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["symbol"] = _symbol;
    map["name"] = _name;
    map["image"] = _image;
    map["current_price"] = _currentPrice;
    map["market_cap"] = _marketCap;
    map["market_cap_rank"] = _marketCapRank;
    map["fully_diluted_valuation"] = _fullyDilutedValuation;
    map["total_volume"] = _totalVolume;
    map["high_24h"] = _high24h;
    map["low_24h"] = _low24h;
    map["price_change_24h"] = _priceChange24h;
    map["price_change_percentage_24h"] = _priceChangePercentage24h;
    map["market_cap_change_24h"] = _marketCapChange24h;
    map["market_cap_change_percentage_24h"] = _marketCapChangePercentage24h;
    map["circulating_supply"] = _circulatingSupply;
    map["total_supply"] = _totalSupply;
    map["max_supply"] = _maxSupply;
    map["ath"] = _ath;
    map["ath_change_percentage"] = _athChangePercentage;
    map["ath_date"] = _athDate;
    map["atl"] = _atl;
    map["atl_change_percentage"] = _atlChangePercentage;
    map["atl_date"] = _atlDate;
    map["roi"] = _roi;
    map["last_updated"] = _lastUpdated;
    return map;
  }

}