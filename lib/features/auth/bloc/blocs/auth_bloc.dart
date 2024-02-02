import 'package:employee/features/auth/bloc/events/auth_event.dart';
import 'package:employee/features/auth/bloc/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BuildContext context;
  AuthBloc(this.context) : super(AuthState.initial()) {
    on<EmailChanged>((event, emit) => onEmailChanged(emit, event));
    on<PasswordChanged>((event, emit) => onPasswordChanged(emit, event));
    on<FormSubmitted>((event, emit) => onFormSubmitted(emit, event));
  }

  void onEmailChanged(Emitter<AuthState> emit, EmailChanged event) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void onPasswordChanged(Emitter<AuthState> emit, PasswordChanged event) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  onFormSubmitted(Emitter<AuthState> emit, FormSubmitted event) {}
}
