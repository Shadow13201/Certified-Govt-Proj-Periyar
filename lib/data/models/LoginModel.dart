class LoginModel {
  LoginModel({
      this.status, 
      this.msg,
      this.role,
      this.data, 
      this.token,});

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    role=json['role'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }
  bool? status;
  String? msg;
  String? role;
  Data? data;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.role, 
      this.phoneNumber, 
      this.name, 
      this.email, 
      this.district, 
      this.city, 
      this.password, 
      this.status, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    district = json['district'];
    city = json['city'] != null ? json['city'].cast<String>() : [];
    password = json['password'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? district;
  List<String>? city;
  String? password;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['role'] = role;
    map['phoneNumber'] = phoneNumber;
    map['name'] = name;
    map['email'] = email;
    map['district'] = district;
    map['city'] = city;
    map['password'] = password;
    map['status'] = status;
    map['__v'] = v;
    return map;
  }

}