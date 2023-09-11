import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/data/models/LoginModel.dart';
import 'package:periyar_adminportal/data/models/WorkProfileModel.dart';
import 'package:periyar_adminportal/data/repository.dart';
import 'package:periyar_adminportal/helper/sharedpreferences.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  WorkBloc() : super(WorkState()) {

    on<CheckWORK>(_checkWork);
  }

  Future<FutureOr<void>> _checkWork(
      CheckWORK event, Emitter<WorkState> emit) async {
    emit(CheckingWork());
    WorkProfileModel workProfileModel;
    Map data = {
      "id": event.id,
      
    };
print(Map);

    workProfileModel =
    await Repository().work(url: '/employeeview/ongoingtasks', data: data);
    if (workProfileModel.status == true) {

print("hello ");

     emit(WorkChecked(workProfileModel:workProfileModel));
    } else {
      emit(WorkError(error: workProfileModel.msg.toString()));
    }
  }
}
//events
class WorkEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckWORK extends WorkEvent {
  final String  id;
  CheckWORK({ required this.id});
}


//states

class WorkState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingWork extends WorkState {}
class WorkChecked extends WorkState {
  final WorkProfileModel workProfileModel;
  WorkChecked({required this.workProfileModel});
}

class WorkError extends WorkState {
  final String error;
  WorkError({required this.error});
}