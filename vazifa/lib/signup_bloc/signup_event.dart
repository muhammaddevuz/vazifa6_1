part of "signup_bloc.dart";

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  final String phoneNumber;
  final String email;
  final String password;

  SignUpSubmitted({required this.phoneNumber, required this.email, required this.password});

  @override
  List<Object> get props => [phoneNumber, email, password];
}

