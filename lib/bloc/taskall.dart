import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:periyar_adminportal/data/repository.dart';

import '../data/models/AllTaskModel.dart';

class AllTaskBloc extends Bloc<AllTaskEvent, AllTaskState> {
  AllTaskBloc() : super(AllTaskState()) {
    on<CheckAllTask>(_checkAllTask);
  }

  Future<FutureOr<void>> _checkAllTask(
      CheckAllTask event, Emitter<AllTaskState> emit) async {
    emit(CheckingAllTask());
    AllTaskModel alltaskModel;

    
    alltaskModel = await Repository().getallTask(url: '/view/alltasks');
    if (alltaskModel.status == true) {
      emit(AllTaskChecked(alltaskModel: alltaskModel));
    } else {
      emit(AllTaskError(error: alltaskModel.msg.toString()));
    }
  }
}

//events
class AllTaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAllTask extends AllTaskEvent {}

//states

class AllTaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAllTask extends AllTaskState {}

class AllTaskChecked extends AllTaskState {
  final AllTaskModel alltaskModel;

  AllTaskChecked({required this.alltaskModel});
}

class AllTaskError extends AllTaskState {
  final String error;

  AllTaskError({required this.error});
}
