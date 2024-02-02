// 1.1 events.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends AuthEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends AuthEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends AuthEvent {
  final GlobalKey<FormState> formKey;
  final BuildContext context;

  const FormSubmitted(this.formKey, this.context);

  @override
  List<Object> get props => [formKey, context];
}
