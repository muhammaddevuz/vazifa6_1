import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/data/services/auth_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(SignUpSubmitted event, emit) async {
    AuthService authService = AuthService();
    emit(SignUpLoading());
    try {
      authService.signUp(
        event.name,
        event.phone,
        event.password,
        event.password_confirmation,
      );
      emit(SignUpLoaded());
    } catch (error) {
      emit(SignUpError(error: error.toString()));
    }
  }
}
