import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/data/models/AllprofileModel.dart';
import 'package:periyar_adminportal/data/repository.dart';

class AllprofileBloc extends Bloc<AllprofileEvent, AllprofileState> {
  var role;
  AllprofileBloc() : super(AllprofileState()) {
    on<CheckAllprofile>(_checkAllprofile);
  }

  Future<FutureOr<void>> _checkAllprofile(
      CheckAllprofile event, Emitter<AllprofileState> emit) async {
    emit(CheckingAllprofile());
    List<User> staff= [];
    List<User> allprofile= [];
    List<User> ranger=[];
 AllprofileModel staffProfileModel;
  AllprofileModel rangerProfileModel;
AllprofileModel allprofileModel;

    staffProfileModel = await Repository().getallprofile(url: '/view/profile?role=Staff');
    rangerProfileModel = await Repository().getallprofile(url: '/view/profile?role=Ranger');
      allprofileModel = await Repository().getallprofile(url: '/view/profile');
      print(allprofileModel);
    staff = staffProfileModel.user!.where((element) => element.role == 'Staff').toList();
    ranger = rangerProfileModel.user!.where((element) => element.role == 'Ranger').toList();
print("stafflist");

    //
    // for(int i = 0; i<allprofile.length; i++){
    //   print(allprofile[i].role);
    // }
   // staffProfileModel = await Repository().getallprofile(url: '/view/profile?role=Ranger');
    if (staffProfileModel.status == true) {
      emit(AllprofileChecked(staff: staff,ranger: ranger,allprofile: allprofileModel.user!,staffProfileModel:staffProfileModel));
    } else {
      emit(AllprofileError(error: staffProfileModel.msg.toString()));
    }
  }
}

//events
class AllprofileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckAllprofile extends AllprofileEvent {}

//states

class AllprofileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAllprofile extends AllprofileState {}

class AllprofileChecked extends AllprofileState {

  final List<User> staff,allprofile,ranger;
  final AllprofileModel staffProfileModel;

  AllprofileChecked({required this.staff,required this.allprofile,required this.staffProfileModel,required this.ranger});
}

class AllprofileError extends AllprofileState {
  final String error;

  AllprofileError({required this.error});
}
