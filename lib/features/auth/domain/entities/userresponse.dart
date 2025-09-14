class Userresponse {
  Userresponse({String? message, Data? data}) {
    _message = message;
    _data = data;
  }

  Userresponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _message;
  Data? _data;

  Userresponse copyWith({String? message, Data? data}) =>
      Userresponse(message: message ?? _message, data: data ?? _data);

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// _id : "68b7751257531f36e62eac3d"
/// email : "ammareldesouki130@gmail.com"
/// password : "$2b$10$8gyvUJIn.jeoR6uQcCVxpujAkJV9jTPA0fmK/bTJ2Kck5DcWG64ay"
/// name : "ammar"
/// phone : "+201067204840"
/// avaterId : 2
/// createdAt : "2025-09-02T22:52:02.978Z"
/// updatedAt : "2025-09-12T12:41:24.155Z"
/// __v : 0

class Data {
  Data({
    String? id,
    String? email,
    String? password,
    String? name,
    String? phone,
    num? avaterId,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _email = email;
    _password = password;
    _name = name;
    _phone = phone;
    _avaterId = avaterId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _email = json['email'];
    _password = json['password'];
    _name = json['name'];
    _phone = json['phone'];
    _avaterId = json['avaterId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _email;
  String? _password;
  String? _name;
  String? _phone;
  num? _avaterId;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  Data copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? phone,
    num? avaterId,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => Data(
    id: id ?? _id,
    email: email ?? _email,
    password: password ?? _password,
    name: name ?? _name,
    phone: phone ?? _phone,
    avaterId: avaterId ?? _avaterId,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );

  String? get id => _id;

  String? get email => _email;

  String? get password => _password;

  String? get name => _name;

  String? get phone => _phone;

  num? get avaterId => _avaterId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['email'] = _email;
    map['password'] = _password;
    map['name'] = _name;
    map['phone'] = _phone;
    map['avaterId'] = _avaterId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
