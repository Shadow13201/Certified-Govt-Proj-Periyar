import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:periyar_adminportal/data/models/AllTaskModel.dart';
import 'package:periyar_adminportal/data/models/AllprofileModel.dart';
import 'package:periyar_adminportal/data/models/BillModel.dart';
import 'package:periyar_adminportal/data/models/ProfileModel.dart';
import 'package:periyar_adminportal/data/models/WorkProfileModel.dart';
import 'package:periyar_adminportal/data/webclient.dart';

import 'models/LoginModel.dart';
import 'models/LogoutModel.dart';
import 'models/TaskDeleteModel.dart';
import 'models/taskaddmodel.dart';

class Repository {
  Future<LoginModel> login({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel loginModel = LoginModel.fromJson(response);
    return loginModel;
  }

  Future<LogoutModel> logout({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final LogoutModel logoutModel = LogoutModel.fromJson(response);
    return logoutModel;
  }

  Future<ProfileModel> getprofile({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final ProfileModel profileModel = ProfileModel.fromJson(response);
    return profileModel;
  }

  Future<AllprofileModel> getallprofile({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final AllprofileModel allprofileModel = AllprofileModel.fromJson(response);
    return allprofileModel;
  }
//taskadd repository---------------------------------------------------------------------------------------------
  Future<Taskaddmodel> gettaskadd({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "chinna problem",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final Taskaddmodel taskaddModel = Taskaddmodel.fromJson(response);
    return taskaddModel;
  }
// getallTask-------------------------------------------------------------------------------------------
  Future<AllTaskModel> getallTask({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final AllTaskModel alltaskModel = AllTaskModel.fromJson(response);
    return alltaskModel;
  }
  //bill submit------------------------------------------------------------------------------------
  Future<BillModel> getbill({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final BillModel billModel = BillModel.fromJson(response);
    return billModel;
  }
//delete task---------------------------------------------------------------------------
  Future<TaskDeleteModel> postTaskDelete({required String url,dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final TaskDeleteModel taskdeleteModel = TaskDeleteModel.fromJson(response);
    return taskdeleteModel;
  }
  //workprofile-----------------------------------------------

  Future<WorkProfileModel> work({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);

    final WorkProfileModel workProfileModel = WorkProfileModel.fromJson(response);
    return workProfileModel;
  }
}
