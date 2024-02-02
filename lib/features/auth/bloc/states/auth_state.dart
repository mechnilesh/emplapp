import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String email;
  final String password;

  const AuthState({
    required this.email,
    required this.password,
  });

  factory AuthState.initial() {
    return const AuthState(
      email: '',
      password: '',
    );
  }

  AuthState copyWith({
    String? email,
    String? password,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password];
}
