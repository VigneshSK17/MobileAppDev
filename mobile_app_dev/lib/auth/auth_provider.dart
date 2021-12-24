import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth; // FirebaseAuth instance

  AuthenticationProvider(this.firebaseAuth); // Constructor to init firebaseAuth

  Stream<User?> get authState => firebaseAuth.idTokenChanges(); // Listen to auth state.

  // Sign Up Method
  // TODO: Modify return value
  Future<String> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Firebase returned no error message for signing up";
    }
  }

  // Sign In Method
  Future<String> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in!";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Firebase returned no error message for signing in";
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}