import 'Location.dart';

class UserResponse {
  UserResponse(
    this.location,
    this.id,
    this.email,
    this.password,
    this.isActive,
    this.userType,
    this.name,
    this.dob,
    this.addressLine1,
    this.addressLine3,
    this.city,
    this.district,
    this.state,
    this.country,
    this.pincode,
    this.createdAt,
    this.updatedAt,
    this.v,
  );

  factory UserResponse.fromJson(dynamic json) {
    return UserResponse(
        json["location"],
        json["id"],
        json["email"],
        json["password"],
        json["isActive"],
        json["userType"],
        json["name"],
        json["dob"],
        json["addressLine1"],
        json["addressLine3"],
        json["city"],
        json["district"],
        json["state"],
        json["country"],
        json["pincode"],
        json["createdAt"],
        json["updatedAt"],
        json["v"]);
  }
  Location location;
  String id;
  String email;
  String password;
  bool isActive;
  String userType;
  String name;
  String dob;
  String addressLine1;
  String addressLine3;
  String city;
  String district;
  String state;
  String country;
  String pincode;
  String createdAt;
  String updatedAt;
  int v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location.toJson();
    }
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['isActive'] = isActive;
    map['userType'] = userType;
    map['name'] = name;
    map['dob'] = dob;
    map['addressLine1'] = addressLine1;
    map['addressLine3'] = addressLine3;
    map['city'] = city;
    map['district'] = district;
    map['state'] = state;
    map['country'] = country;
    map['pincode'] = pincode;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
