part of "signup_bloc.dart";
abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {}

class SignUpError extends SignUpState {
  final String error;

  SignUpError({required this.error});

  @override
  List<Object> get props => [error];
}