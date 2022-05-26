abstract class AuthState {
  AuthState();
}

class AuthInitial extends AuthState {
  AuthInitial();
}

class AuthLoading extends AuthState {
  AuthLoading();
}

class AuthError extends AuthState {
  AuthError();
}
