class UserDetailModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserDetailModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    username = json['username'] as String?;
    email = json['email'] as String?;
    address = (json['address'] as Map<String,dynamic>?) != null ? Address.fromJson(json['address'] as Map<String,dynamic>) : null;
    phone = json['phone'] as String?;
    website = json['website'] as String?;
    company = (json['company'] as Map<String,dynamic>?) != null ? Company.fromJson(json['company'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['username'] = username;
    json['email'] = email;
    json['address'] = address?.toJson();
    json['phone'] = phone;
    json['website'] = website;
    json['company'] = company?.toJson();
    return json;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'] as String?;
    suite = json['suite'] as String?;
    city = json['city'] as String?;
    zipcode = json['zipcode'] as String?;
    geo = (json['geo'] as Map<String,dynamic>?) != null ? Geo.fromJson(json['geo'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['street'] = street;
    json['suite'] = suite;
    json['city'] = city;
    json['zipcode'] = zipcode;
    json['geo'] = geo?.toJson();
    return json;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] as String?;
    lng = json['lng'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['lat'] = lat;
    json['lng'] = lng;
    return json;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    catchPhrase = json['catchPhrase'] as String?;
    bs = json['bs'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['catchPhrase'] = catchPhrase;
    json['bs'] = bs;
    return json;
  }
}