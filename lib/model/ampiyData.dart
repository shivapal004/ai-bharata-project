class AmpiyData {
  AmpiyData({
    required String stream,
    required List<Data> data,
  })  : _stream = stream,
        _data = data;

  AmpiyData.fromJson(dynamic json)
      : _stream = json['stream'],
        _data = (json['data'] as List<dynamic>?)
            ?.map((item) => Data.fromJson(item))
            .toList() ??
            [];

  final String _stream;
  final List<Data> _data;

  AmpiyData copyWith({
    String? stream,
    List<Data>? data,
  }) =>
      AmpiyData(
        stream: stream ?? _stream,
        data: data ?? _data,
      );

  String get stream => _stream;
  List<Data> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stream'] = _stream;
    map['data'] = _data.map((v) => v.toJson()).toList();
    return map;
  }
}

class Data {
  Data({
    required String t,
    required String s,
    required String p,
    required String P,
    required String c,
    required String o,
    required String h,
    required String l,
    required String b,
    required String a,
    required String cu,
    required String au,
    required String bu,
  })  : _t = t,
        _s = s,
        _p = p,
        _P = P,
        _c = c,
        _o = o,
        _h = h,
        _l = l,
        _b = b,
        _a = a,
        _cu = cu,
        _au = au,
        _bu = bu;

  Data.fromJson(dynamic json)
      : _t = json['T'],
        _s = json['s'],
        _p = json['p'],
        _P = json['P'],
        _c = json['c'],
        _o = json['o'],
        _h = json['h'],
        _l = json['l'],
        _b = json['b'],
        _a = json['a'],
        _cu = json['cu'],
        _au = json['au'],
        _bu = json['bu'];

  final String _t;
  final String _s;
  final String _p;
  final String _P;
  final String _c;
  final String _o;
  final String _h;
  final String _l;
  final String _b;
  final String _a;
  final String _cu;
  final String _au;
  final String _bu;

  Data copyWith({
    String? t,
    String? s,
    String? p,
    String? P,
    String? c,
    String? o,
    String? h,
    String? l,
    String? b,
    String? a,
    String? cu,
    String? au,
    String? bu,
  }) =>
      Data(
        t: t ?? _t,
        s: s ?? _s,
        p: p ?? _p,
        P: P ?? _P,
        c: c ?? _c,
        o: o ?? _o,
        h: h ?? _h,
        l: l ?? _l,
        b: b ?? _b,
        a: a ?? _a,
        cu: cu ?? _cu,
        au: au ?? _au,
        bu: bu ?? _bu,
      );

  String get t => _t;
  String get s => _s;
  String get p => _p;
  String get P => _P;
  String get c => _c;
  String get o => _o;
  String get h => _h;
  String get l => _l;
  String get b => _b;
  String get a => _a;
  String get cu => _cu;
  String get au => _au;
  String get bu => _bu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['T'] = _t;
    map['s'] = _s;
    map['p'] = _p;
    map['P'] = _P;
    map['c'] = _c;
    map['o'] = _o;
    map['h'] = _h;
    map['l'] = _l;
    map['b'] = _b;
    map['a'] = _a;
    map['cu'] = _cu;
    map['au'] = _au;
    map['bu'] = _bu;
    return map;
  }
}
