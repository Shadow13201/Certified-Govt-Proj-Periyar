



import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/data/models/TaskDeleteModel.dart';
import 'package:periyar_adminportal/data/repository.dart';

class TaskDeleteBloc extends Bloc<TaskDeleteEvent, TaskDeleteState> {
  TaskDeleteBloc() : super(TaskDeleteState()) {

    on<CheckTaskDelete>(_checkTaskDelete);
  }



  Future<FutureOr<void>> _checkTaskDelete(
      CheckTaskDelete event, Emitter<TaskDeleteState> emit) async {
    emit(CheckingTaskDelete());
    TaskDeleteModel taskdeleteModel;
    Map data = {
                            "_id": event.id,
                    

    };


    taskdeleteModel = await Repository().postTaskDelete(url: '/task/delete', data: data);
    if (taskdeleteModel.status == true) {
      
      emit(TaskDeleteChecked());
    } else if (taskdeleteModel.status == false) {
      emit(TaskDeleteError(error: taskdeleteModel.msg.toString()));
    }
  }
}



//events
class TaskDeleteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckTaskDelete extends TaskDeleteEvent {
  final String id;
  
  CheckTaskDelete({required this.id});
}


//states

class TaskDeleteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingTaskDelete extends TaskDeleteState {}
class TaskDeleteChecked extends TaskDeleteState {}

class TaskDeleteError extends TaskDeleteState {
  final String error;
  TaskDeleteError({required this.error});
}