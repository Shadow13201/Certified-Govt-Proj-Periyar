import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyar_adminportal/data/models/ProfileModel.dart';
import 'package:periyar_adminportal/data/repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<CheckProfile>(_checkProfile);
  }

  Future<FutureOr<void>> _checkProfile(
      CheckProfile event, Emitter<ProfileState> emit) async {
    emit(CheckingProfile());
    ProfileModel profileModel;

    profileModel =
    await Repository().getprofile(url: '/user/ownprofileview');

    profileModel = await Repository().getprofile(url: '/user/ownprofileview');

    if (profileModel.status == true) {
      emit(ProfileChecked(profileModel: profileModel));
    } else {
      print(profileModel.msg.toString() + "msfgh");
      emit(ProfileError(error: profileModel.msg.toString()));
    }
  }
}

//events
class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckProfile extends ProfileEvent {}

//states

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingProfile extends ProfileState {}

class ProfileChecked extends ProfileState {
  final ProfileModel profileModel;

  ProfileChecked({required this.profileModel});
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}
