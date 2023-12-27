import '../../../repository/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<bool> call(String email, String name, String password) {
    return repository.signUpUser(email, name, password);
  }
}
