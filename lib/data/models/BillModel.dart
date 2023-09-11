class BillModel {
  BillModel({
      this.status, 
      this.msg, 
      this.data,});

  BillModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.status, 
      this.billStatus, 
      this.id, 
      this.billsubmittedBy, 
      this.billName, 
      this.amount, 
      this.billDate, 
      this.createDate, 
      this.updateDate, 
      this.v,});

  Data.fromJson(dynamic json) {
    status = json['status'];
    billStatus = json['billStatus'];
    id = json['_id'];
    billsubmittedBy = json['billsubmittedBy'];
    billName = json['billName'];
    amount = json['amount'];
    billDate = json['billDate'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    v = json['__v'];
  }
  String? status;
  String? billStatus;
  String? id;
  String? billsubmittedBy;
  String? billName;
  int? amount;
  String? billDate;
  String? createDate;
  String? updateDate;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['billStatus'] = billStatus;
    map['_id'] = id;
    map['billsubmittedBy'] = billsubmittedBy;
    map['billName'] = billName;
    map['amount'] = amount;
    map['billDate'] = billDate;
    map['create_date'] = createDate;
    map['update_date'] = updateDate;
    map['__v'] = v;
    return map;
  }

}