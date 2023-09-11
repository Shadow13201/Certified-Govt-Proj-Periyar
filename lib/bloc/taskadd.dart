import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/data/models/LoginModel.dart';

import 'package:periyar_adminportal/data/repository.dart';
import 'package:periyar_adminportal/helper/sharedpreferences.dart';

import 'package:periyar_adminportal/data/models/taskaddmodel.dart';
import 'package:periyar_adminportal/data/repository.dart';
import 'package:periyar_adminportal/helper/sharedpreferences.dart';

import '../data/models/LoginModel.dart';
import '../data/repository.dart';
import '../helper/sharedpreferences.dart';



class TaskaddBloc extends Bloc<TaskaddEvent, TaskaddState> {
  TaskaddBloc() : super(TaskaddState()) {

    on<CheckTaskadd>(_checkTaskadd);
  }



  Future<FutureOr<void>> _checkTaskadd(
      CheckTaskadd event, Emitter<TaskaddState> emit) async {
    emit(CheckingTaskadd());
    Taskaddmodel taskaddModel;
    Map data = {
                            "taskName": event.taskName,
                      "employeeId": event.employeeId,
                      "task": event.task,
                      "fromDate":event.fromDate,
                      "toDate":event.toDate,

    };


    taskaddModel = await Repository().gettaskadd(url: '/employee/assign/task', data: data);
    if (taskaddModel.status == true) {
      
      emit(TaskaddChecked());
    } else if (taskaddModel.status == false) {
      emit(TaskaddError(error: taskaddModel.msg.toString()));
    }
  }
}



//events
class TaskaddEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckTaskadd extends TaskaddEvent {
  final String taskName,task,fromDate,toDate;
  final List<String> employeeId;
  CheckTaskadd({required this.taskName,required this.employeeId,required this.task,required this.fromDate,required this.toDate});
}


//states

class TaskaddState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingTaskadd extends TaskaddState {}
class TaskaddChecked extends TaskaddState {}

class TaskaddError extends TaskaddState {
  final String error;
  TaskaddError({required this.error});
}