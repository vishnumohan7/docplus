part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadFailure extends AuthState {
  final String errorMessage;

  AuthLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}