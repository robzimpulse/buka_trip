import 'package:buka_trip/infrastructure/providers/auth.provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService implements AuthProvider {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> register({
    required String email, required String password
  }) async {
    final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password
    );
    User? user = userCredential.user;
    if (user?.emailVerified == false) {
      await userCredential.user?.sendEmailVerification();
    }
    return user;
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    final UserCredential userCredential =  await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  @override
  Future<void> logout() async => await _firebaseAuth.signOut();

  @override
  Future<void> resetPassword({
    required String email
  }) async => await _firebaseAuth.sendPasswordResetEmail(email: email);
}