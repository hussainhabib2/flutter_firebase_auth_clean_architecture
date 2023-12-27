abstract class FirebaseRepository {
  Future<bool> checkUser(String email);
  Future<bool> signInUser(String email, String password);
  Future<bool> signUpUser(String email, String name, String password);
}
