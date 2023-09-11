class ProfileModel {
  ProfileModel({
      this.status, 
      this.msg, 
      this.user,});

  ProfileModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? status;
  String? msg;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.role, 
      this.phoneNumber, 
      this.name, 
      this.email, 
      this.district, 
      this.city, 
      this.password, 
      this.status, 
      this.designationId, 
      this.designationName, 
      this.v,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    district = json['district'];
    if (json['city'] != null) {
      city = [];
      json['city'].forEach((v) {
        city?.add((v));
      });
    }
    password = json['password'];
    status = json['status'];
    designationId = json['designationId'] != null ? DesignationId.fromJson(json['designationId']) : null;
    designationName = json['designationName'];
    v = json['__v'];
  }
  String? id;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? district;
  List<dynamic>? city;
  String? password;
  String? status;
  DesignationId? designationId;
  String? designationName;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['role'] = role;
    map['phoneNumber'] = phoneNumber;
    map['name'] = name;
    map['email'] = email;
    map['district'] = district;
    if (city != null) {
      map['city'] = city?.map((v) => v.toJson()).toList();
    }
    map['password'] = password;
    map['status'] = status;
    if (designationId != null) {
      map['designationId'] = designationId?.toJson();
    }
    map['designationName'] = designationName;
    map['__v'] = v;
    return map;
  }

}

class DesignationId {
  DesignationId({
      this.id, 
      this.designationName, 
      this.status, 
      this.v,});

  DesignationId.fromJson(dynamic json) {
    id = json['_id'];
    designationName = json['designation_name'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  String? designationName;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['designation_name'] = designationName;
    map['status'] = status;
    map['__v'] = v;
    return map;
  }

}