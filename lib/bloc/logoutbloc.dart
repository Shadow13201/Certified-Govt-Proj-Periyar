import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/data/models/LogoutModel.dart';
import 'package:periyar_adminportal/data/repository.dart';
import 'package:periyar_adminportal/helper/sharedpreferences.dart';

class LogBloc extends Bloc<LogEvent, LogState> {
  LogBloc() : super(LogState()) {

    on<CheckLOGOUT>(_checkLogout);

    on<CheckAuth>(_checkAuth);
  }

  Future<FutureOr<void>> _checkLogout(
      CheckLOGOUT event, Emitter<LogState> emit) async {
    emit(CheckingLogout());
    LogoutModel logoutModel;
   


    logoutModel =
    await Repository().logout(url: '/superAdmin/logout', );
    if (logoutModel.status == true) {
      await TempStorage.removeToken();


      emit(LogoutChecked());
    } else {
      emit(LogoutError(error: logoutModel.msg.toString()));
    }
  }



  Future<FutureOr<void>> _checkAuth(CheckAuth event, Emitter<LogState> emit) async {
    var token = await TempStorage.getToken();
   var role = await TempStorage.getRole();
    if (token != null) {
      emit(AuthConfirmed(role: role));

    } else if (token == null) {
      emit(AuthNotConfirmed());
    }
  }
}
//events
class LogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckLOGOUT extends LogEvent {

}

class CheckAuth extends LogEvent {

}


//states

class LogState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingLogout extends LogState {}
class LogoutChecked extends LogState {}

class LogoutError extends LogState {
  final String error;
  LogoutError({required this.error});
}
class AuthNotConfirmed extends LogState {}

class AuthConfirmed extends LogState {
  final String role;
  AuthConfirmed({required this.role});
}