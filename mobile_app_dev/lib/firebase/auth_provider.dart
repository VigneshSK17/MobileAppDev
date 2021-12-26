import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth; // FirebaseAuth instance

  AuthenticationProvider(this.firebaseAuth); // Constructor to init firebaseAuth

  Stream<User?> get authState => firebaseAuth.idTokenChanges(); // Listen to auth state.

  // Sign Up Method
  Future<String> signUp({required String email, required String password, required firstName, required lastName, required schoolName, required String role}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        // TODO: Add more fields to this if needed
        await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          'uid': user.uid,
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'role': role
        });
      });
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
