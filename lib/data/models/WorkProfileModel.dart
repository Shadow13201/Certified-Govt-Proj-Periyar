class WorkProfileModel {
  WorkProfileModel({
    this.status,
    this.msg,
    this.taskongoinglength,
    this.taskdelayedlength,
    this.taskcompletedlength,});

  WorkProfileModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    taskongoinglength = json['taskongoinglength'];
    taskdelayedlength = json['taskdelayedlength'];
    taskcompletedlength = json['taskcompletedlength'];
  }
  bool? status;
  String? msg;
  int? taskongoinglength;
  int? taskdelayedlength;
  int? taskcompletedlength;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    map['taskongoinglength'] = taskongoinglength;
    map['taskdelayedlength'] = taskdelayedlength;
    map['taskcompletedlength'] = taskcompletedlength;
    return map;
  }

}