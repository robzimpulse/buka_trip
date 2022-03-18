import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Future <void> logout();
  Stream <User?> authStateChanges();
  Future <User?> login ({required String email, required String password});
  Future <User?> register ({required String email, required String password});
}

class AuthService implements AuthBase {

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> register({
    required String email, required String password
  }) async {
    final userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    final userCredential =  await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  @override
  Future<void> logout() async => await _firebaseAuth.signOut();
}