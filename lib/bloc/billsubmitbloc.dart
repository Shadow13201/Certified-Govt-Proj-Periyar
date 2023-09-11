import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:periyar_adminportal/data/repository.dart';
import 'package:periyar_adminportal/helper/sharedpreferences.dart';

import '../data/models/BillModel.dart';

class billsubmitBloc extends Bloc<billsubmitEvent, billsubmitState> {
  billsubmitBloc() : super(billsubmitState()) {

    on<CheckBILL>(_checkBill);
  }

  Future<FutureOr<void>> _checkBill(
      CheckBILL event, Emitter<billsubmitState> emit) async {
    emit(CheckingBill());
    BillModel billModel;
    Map data = {
      "billName": event.billName,
      "billDesc": event.billDesc,
      "billDate":event.billDate,
      "amount":event.amount
    };


    billModel =
    await Repository().getbill(url: '/employee/bill/submit', data: data);
    if (billModel.status == true) {
      emit(BillChecked(billModel: billModel));



    } else {
      emit(BillError(error: billModel.msg.toString()));
    }
  }
}
//events
class billsubmitEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckBILL extends billsubmitEvent {
  final String  billName,billDesc,billDate,amount;
  CheckBILL({ required this.billName,required this.billDesc,required this.billDate,required this.amount});
}


//states

class billsubmitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingBill extends billsubmitState {}
class BillChecked extends billsubmitState {
  final BillModel billModel;
  BillChecked({required this.billModel});
}

class BillError extends billsubmitState {
  final String error;
  BillError({required this.error});
}