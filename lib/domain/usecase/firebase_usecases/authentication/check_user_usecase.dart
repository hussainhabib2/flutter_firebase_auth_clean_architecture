import '../../../repository/firebase_repository.dart';

class CheckUserUseCase {
  final FirebaseRepository repository;

  CheckUserUseCase({required this.repository});

  Future<bool> call(String email) {
    return repository.checkUser(email);
  }
}
