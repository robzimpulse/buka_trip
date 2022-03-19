import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthProvider {
  User? get currentUser;
  Future <void> logout();
  Stream <User?> authStateChanges();
  Future <User?> login ({required String email, required String password});
  Future <User?> register ({required String email, required String password});
  Future <void> resetPassword({required String email});
}