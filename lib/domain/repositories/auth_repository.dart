abstract interface class AuthRepository {
  Future<void> signInWithGoogle();

  Future<void> signInWithPhone(String phone);

  Future<void> createAccount(String emailAddress, String password);

  Future<void> loginUser(String email, String password);
}
