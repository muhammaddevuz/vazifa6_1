import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa/signin_bloc/signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEvent>(_onSignin);
    on<SignOut>(_onLogOut);
  }

  Future<void> _onSignin(SignInEvent event, emit) async {
    emit(SignInLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(SignInLoadedState());
    } catch (error) {
      emit(SignInErrorState(error: error.toString()));
    }
  }

  Future<void> _onLogOut(SignOut event, emit) async {
    emit(SignedOutState());
  }
}
