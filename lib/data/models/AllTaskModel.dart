class AllTaskModel {
  AllTaskModel({
      this.status, 
      this.msg, 
      this.data, 
      this.length,});

  AllTaskModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    length = json['length'];
  }
  bool? status;
  String? msg;
  List<Data>? data;
  int? length;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['length'] = length;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.status, 
      this.taskStatus, 
      this.userid, 
      this.taskAssignedBy, 
      this.task, 
      this.taskName, 
      this.taskAssigedFrom, 
      this.taskAssignedTo, 
      this.createDate, 
      this.updateDate, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    status = json['status'];
    taskStatus = json['taskStatus'];
    userid = json['userid'] != null ? Userid.fromJson(json['userid']) : null;
    taskAssignedBy = json['taskAssignedBy'] != null ? TaskAssignedBy.fromJson(json['taskAssignedBy']) : null;
    task = json['task'];
    taskName = json['taskName'];
    taskAssigedFrom = json['taskAssigedFrom'];
    taskAssignedTo = json['taskAssignedTo'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    v = json['__v'];
  }
  String? id;
  String? status;
  String? taskStatus;
  Userid? userid;
  TaskAssignedBy? taskAssignedBy;
  String? task;
  String? taskName;
  String? taskAssigedFrom;
  String? taskAssignedTo;
  String? createDate;
  String? updateDate;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['status'] = status;
    map['taskStatus'] = taskStatus;
    if (userid != null) {
      map['userid'] = userid?.toJson();
    }
    if (taskAssignedBy != null) {
      map['taskAssignedBy'] = taskAssignedBy?.toJson();
    }
    map['task'] = task;
    map['taskName'] = taskName;
    map['taskAssigedFrom'] = taskAssigedFrom;
    map['taskAssignedTo'] = taskAssignedTo;
    map['create_date'] = createDate;
    map['update_date'] = updateDate;
    map['__v'] = v;
    return map;
  }

}

class TaskAssignedBy {
  TaskAssignedBy({
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

  TaskAssignedBy.fromJson(dynamic json) {
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

class Userid {
  Userid({
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

  Userid.fromJson(dynamic json) {
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