import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(SignUpSubmitted event, emit) async {
    emit(SignUpLoading());
    try {
      Future.delayed(const Duration(seconds: 2));
      emit(SignUpLoaded());
    } catch (error) {
      emit(SignUpError(error: error.toString()));
    }
  }
}
