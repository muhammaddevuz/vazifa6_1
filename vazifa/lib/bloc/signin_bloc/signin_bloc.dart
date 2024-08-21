import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/bloc/signin_bloc/signin_event.dart';
import 'package:vazifa/data/services/auth_service.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInSubmitted>(_onSignInSubmitted);
    on<SignOut>(_onLogOut);
  }

  Future<void> _onSignInSubmitted(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    AuthService authService = AuthService();
    emit(SignInLoadingState());
    try {
      final result = await authService.signIn(event.phone, event.password);
      if (result['success'] == true) {
        emit(SignInLoadedState());
      } else {
        emit(SignInErrorState(error: "Login failed"));
      }
    } catch (e) {
      emit(SignInErrorState(error: e.toString()));
    }
  }

  Future<void> _onLogOut(SignOut event, emit) async {
    emit(SignedOutState());
  }
}
