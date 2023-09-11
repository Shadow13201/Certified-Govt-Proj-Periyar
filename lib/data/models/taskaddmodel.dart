class Taskaddmodel {
  Taskaddmodel({
      this.status, 
      this.msg, 
      this.data,});

  Taskaddmodel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
    this.status,
    this.taskStatus,
    this.id,
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
    status = json['status'];
    taskStatus = json['taskStatus'];
    id = json['_id'];
    userid = json['userid'];
    taskAssignedBy = json['taskAssignedBy'];
    task = json['task'];
    taskName = json['taskName'];
    taskAssigedFrom = json['taskAssigedFrom'];
    taskAssignedTo = json['taskAssignedTo'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    v = json['__v'];
  }
  String? status;
  String? taskStatus;
  String? id;
  String? userid;
  String? taskAssignedBy;
  String? task;
  String? taskName;
  String? taskAssigedFrom;
  String? taskAssignedTo;
  String? createDate;
  String? updateDate;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['taskStatus'] = taskStatus;
    map['_id'] = id;
    map['userid'] = userid;
    map['taskAssignedBy'] = taskAssignedBy;
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