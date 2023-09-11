import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TokenManagerBoc extends Bloc<TokenManagerEvent, TokenManagerState> {
  var token;
  TokenManagerBoc() : super(TokenManagerState()) {}

}

//events
class TokenManagerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckTokenManager extends TokenManagerEvent {}

//states

class TokenManagerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAllprofile extends TokenManagerState {}

class AllprofileChecked extends TokenManagerState {

  final List staff,allprofile;

  AllprofileChecked({required this.staff,required this.allprofile});
}

class AllprofileError extends TokenManagerState {
  final String error;

  AllprofileError({required this.error});
}
