part of "signin_bloc.dart";

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInLoadedState extends SignInState {}

class SignedOutState extends SignInState{}

class SignInErrorState extends SignInState {
  final String error;

  SignInErrorState({required this.error});

  @override
  List<Object> get props => [error];
}