/// name : "Xổ số Miền Bắc"
/// icon : "soxo.webp"
/// link : "https://xskt.com.vn/rss-feed/mien-bac-xsmb.rss"

class XosoEntity {
  String? _name;
  String? _icon;
  String? _link;

  String? get name => _name;
  String? get icon => _icon;
  String? get link => _link;

  XosoEntity({
      String? name, 
      String? icon, 
      String? link}){
    _name = name;
    _icon = icon;
    _link = link;
}

  XosoEntity.fromJson(dynamic json) {
    _name = json["name"];
    _icon = json["icon"];
    _link = json["link"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["icon"] = _icon;
    map["link"] = _link;
    return map;
  }

}