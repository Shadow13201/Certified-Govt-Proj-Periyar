class AllprofileModel {
  AllprofileModel({
    this.status,
    this.msg,
    this.user,});

  AllprofileModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['user'] != null) {
      user = [];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
  }
  bool? status;
  String? msg;
  List<User>? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (user != null) {
      map['user'] = user?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class User {
  User({
    this.id,
    this.userid,
    this.role,
    this.phoneNumber,
    this.name,
    this.email,
    this.district,
    this.status,
    this.designationId,
    this.v,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    userid = json['userid'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    district = json['district'];
    status = json['status'];
    designationId = json['designationId'] != null ? DesignationId.fromJson(json['designationId']) : null;
    v = json['__v'];
  }
  String? id;
  String? userid;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? district;
  String? status;
  DesignationId? designationId;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['userid'] = userid;
    map['role'] = role;
    map['phoneNumber'] = phoneNumber;
    map['name'] = name;
    map['email'] = email;
    map['district'] = district;
    map['status'] = status;
    if (designationId != null) {
      map['designationId'] = designationId?.toJson();
    }
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