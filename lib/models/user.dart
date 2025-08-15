import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({this.users, this.total, this.skip, this.limit});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      users: map['users'] != null
          ? (map['users'] as List<dynamic>)
                .map((e) => UsersItem.fromMap(e as Map<String, dynamic>))
                .toList()
          : null,
      total: map['total'] as int?,
      skip: map['skip'] as int?,
      limit: map['limit'] as int?,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final List<UsersItem>? users;
  final int? total;
  final int? skip;
  final int? limit;

  Map<String, dynamic> toMap() {
    return {
      'users': users?.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  String toJson() => json.encode(toMap());

  UserModel copyWith({
    List<UsersItem>? users,
    int? total,
    int? skip,
    int? limit,
  }) {
    return UserModel(
      users: users ?? this.users,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [users, total, skip, limit];
}

class UsersItem extends Equatable {
  const UsersItem({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  factory UsersItem.fromMap(Map<String, dynamic> map) {
    return UsersItem(
      id: map['id'] as int?,
      firstName: map['firstName'] as String?,
      lastName: map['lastName'] as String?,
      maidenName: map['maidenName'] as String?,
      age: map['age'] as int?,
      gender: map['gender'] as String?,
      email: map['email'] as String?,
      phone: map['phone'] as String?,
      username: map['username'] as String?,
      password: map['password'] as String?,
      birthDate: map['birthDate'] as String?,
      image: map['image'] as String?,
      bloodGroup: map['bloodGroup'] as String?,
      height: map['height'] as double?,
      weight: map['weight'] as double?,
      eyeColor: map['eyeColor'] as String?,
      hair: map['hair'] != null
          ? Hair.fromMap(map['hair'] as Map<String, dynamic>)
          : null,
      ip: map['ip'] as String?,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      macAddress: map['macAddress'] as String?,
      university: map['university'] as String?,
      bank: map['bank'] != null
          ? Bank.fromMap(map['bank'] as Map<String, dynamic>)
          : null,
      company: map['company'] != null
          ? Company.fromMap(map['company'] as Map<String, dynamic>)
          : null,
      ein: map['ein'] as String?,
      ssn: map['ssn'] as String?,
      userAgent: map['userAgent'] as String?,
      crypto: map['crypto'] != null
          ? Crypto.fromMap(map['crypto'] as Map<String, dynamic>)
          : null,
      role: map['role'] as String?,
    );
  }

  factory UsersItem.fromJson(String source) =>
      UsersItem.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final int? age;
  final String? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? birthDate;
  final String? image;
  final String? bloodGroup;
  final double? height;
  final double? weight;
  final String? eyeColor;
  final Hair? hair;
  final String? ip;
  final Address? address;
  final String? macAddress;
  final String? university;
  final Bank? bank;
  final Company? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final Crypto? crypto;
  final String? role;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'birthDate': birthDate,
      'image': image,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
      'eyeColor': eyeColor,
      'hair': hair?.toMap(),
      'ip': ip,
      'address': address?.toMap(),
      'macAddress': macAddress,
      'university': university,
      'bank': bank?.toMap(),
      'company': company?.toMap(),
      'ein': ein,
      'ssn': ssn,
      'userAgent': userAgent,
      'crypto': crypto?.toMap(),
      'role': role,
    };
  }

  String toJson() => json.encode(toMap());

  UsersItem copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? bloodGroup,
    double? height,
    double? weight,
    String? eyeColor,
    Hair? hair,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
    String? role,
  }) {
    return UsersItem(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      maidenName: maidenName ?? this.maidenName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
      image: image ?? this.image,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      eyeColor: eyeColor ?? this.eyeColor,
      hair: hair ?? this.hair,
      ip: ip ?? this.ip,
      address: address ?? this.address,
      macAddress: macAddress ?? this.macAddress,
      university: university ?? this.university,
      bank: bank ?? this.bank,
      company: company ?? this.company,
      ein: ein ?? this.ein,
      ssn: ssn ?? this.ssn,
      userAgent: userAgent ?? this.userAgent,
      crypto: crypto ?? this.crypto,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    maidenName,
    age,
    gender,
    email,
    phone,
    username,
    password,
    birthDate,
    image,
    bloodGroup,
    height,
    weight,
    eyeColor,
    hair,
    ip,
    address,
    macAddress,
    university,
    bank,
    company,
    ein,
    ssn,
    userAgent,
    crypto,
    role,
  ];
}

class Hair extends Equatable {
  const Hair({this.color, this.type});

  factory Hair.fromMap(Map<String, dynamic> map) {
    return Hair(color: map['color'] as String?, type: map['type'] as String?);
  }

  factory Hair.fromJson(String source) =>
      Hair.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? color;
  final String? type;

  Map<String, dynamic> toMap() {
    return {'color': color, 'type': type};
  }

  String toJson() => json.encode(toMap());

  Hair copyWith({String? color, String? type}) {
    return Hair(color: color ?? this.color, type: type ?? this.type);
  }

  @override
  List<Object?> get props => [color, type];
}

class Address extends Equatable {
  const Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map['address'] as String?,
      city: map['city'] as String?,
      state: map['state'] as String?,
      stateCode: map['stateCode'] as String?,
      postalCode: map['postalCode'] as String?,
      coordinates: map['coordinates'] != null
          ? Coordinates.fromMap(map['coordinates'] as Map<String, dynamic>)
          : null,
      country: map['country'] as String?,
    );
  }

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final Coordinates? coordinates;
  final String? country;

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'city': city,
      'state': state,
      'stateCode': stateCode,
      'postalCode': postalCode,
      'coordinates': coordinates?.toMap(),
      'country': country,
    };
  }

  String toJson() => json.encode(toMap());

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates? coordinates,
    String? country,
  }) {
    return Address(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      postalCode: postalCode ?? this.postalCode,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props => [
    address,
    city,
    state,
    stateCode,
    postalCode,
    coordinates,
    country,
  ];
}

class Bank extends Equatable {
  const Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      cardExpire: map['cardExpire'] as String?,
      cardNumber: map['cardNumber'] as String?,
      cardType: map['cardType'] as String?,
      currency: map['currency'] as String?,
      iban: map['iban'] as String?,
    );
  }

  factory Bank.fromJson(String source) =>
      Bank.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  Map<String, dynamic> toMap() {
    return {
      'cardExpire': cardExpire,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'currency': currency,
      'iban': iban,
    };
  }

  String toJson() => json.encode(toMap());

  Bank copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) {
    return Bank(
      cardExpire: cardExpire ?? this.cardExpire,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      currency: currency ?? this.currency,
      iban: iban ?? this.iban,
    );
  }

  @override
  List<Object?> get props => [cardExpire, cardNumber, cardType, currency, iban];
}

class Company extends Equatable {
  const Company({this.department, this.name, this.title, this.address});

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      department: map['department'] as String?,
      name: map['name'] as String?,
      title: map['title'] as String?,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
    );
  }

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? department;
  final String? name;
  final String? title;
  final Address? address;

  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'name': name,
      'title': title,
      'address': address?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  Company copyWith({
    String? department,
    String? name,
    String? title,
    Address? address,
  }) {
    return Company(
      department: department ?? this.department,
      name: name ?? this.name,
      title: title ?? this.title,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [department, name, title, address];
}

class Crypto extends Equatable {
  const Crypto({this.coin, this.wallet, this.network});

  factory Crypto.fromMap(Map<String, dynamic> map) {
    return Crypto(
      coin: map['coin'] as String?,
      wallet: map['wallet'] as String?,
      network: map['network'] as String?,
    );
  }

  factory Crypto.fromJson(String source) =>
      Crypto.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? coin;
  final String? wallet;
  final String? network;

  Map<String, dynamic> toMap() {
    return {'coin': coin, 'wallet': wallet, 'network': network};
  }

  String toJson() => json.encode(toMap());

  Crypto copyWith({String? coin, String? wallet, String? network}) {
    return Crypto(
      coin: coin ?? this.coin,
      wallet: wallet ?? this.wallet,
      network: network ?? this.network,
    );
  }

  @override
  List<Object?> get props => [coin, wallet, network];
}

class Coordinates extends Equatable {
  const Coordinates({this.lat, this.lng});

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(lat: map['lat'] as double?, lng: map['lng'] as double?);
  }

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source) as Map<String, dynamic>);

  final double? lat;
  final double? lng;

  Map<String, dynamic> toMap() {
    return {'lat': lat, 'lng': lng};
  }

  String toJson() => json.encode(toMap());

  Coordinates copyWith({double? lat, double? lng}) {
    return Coordinates(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  @override
  List<Object?> get props => [lat, lng];
}
