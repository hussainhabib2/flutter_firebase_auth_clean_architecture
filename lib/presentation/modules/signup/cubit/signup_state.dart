abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {
  Object get props => [];
}

class SignupLoading extends SignupState {
  Object get props => [];
}

class SignupSuccess extends SignupState {
  Object get props => [];
}

class SignupFailure extends SignupState {
  @override
  Object get props => [];
}
