abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  Object get props => [];
}

class LoginLoading extends LoginState {
  Object get props => [];
}

class LoginSuccess extends LoginState {
  Object get props => [];
}

class UserExists extends LoginState {
  Object get props => [];
}

class LoginIncorrect extends LoginState {
  Object get props => [];
}

class LoginNotExist extends LoginState {
  Object get props => [];
}

class LoginFailure extends LoginState {
  Object get props => [];
}
