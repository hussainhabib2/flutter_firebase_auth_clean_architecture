import '../../../repository/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<bool> call(String email , String password) {
    return repository.signInUser(email , password);
  }

}
