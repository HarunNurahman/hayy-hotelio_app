part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// class AuthGetCurrentUser extends AuthEvent {}

class AuthSignIn extends AuthEvent {
  final String email;
  final String password;
  const AuthSignIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class AuthSignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const AuthSignUp(this.name, this.email, this.password);

  @override
  List<Object> get props => [name, email, password];
}

class AuthSignOut extends AuthEvent {}
