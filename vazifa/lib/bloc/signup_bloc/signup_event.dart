part of "signup_bloc.dart";

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  final String phone;
  final String name;
  final String password;
  final String password_confirmation;

  SignUpSubmitted({required this.phone, required this.name, required this.password, required this.password_confirmation});

  @override
  List<Object> get props => [phone, name, password,password_confirmation];
}

