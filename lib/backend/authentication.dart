import 'package:cc_bogota/models/cc_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

User currentUser() {
  return _auth.currentUser;
}

Future<CCUser> signIn(email, password) async {
  UserCredential userCredential;
  try {
    userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    String token = await userCredential.user.getIdToken();
    String uid = userCredential.user.uid;
    print(token);
    return CCUser(firebaseID: uid, sessionToken: token);
  } catch (error) {
    switch (error.code) {
      case "user-not-found":
        throw Exception('Usuario no encontrado.');
      case "wrong-password":
        throw Exception('Contraseña equivocada.');
      default:
        throw Exception('Intentalo de nuevo');
    }
  }
}

Future<bool> recover(email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    return true;
  } catch (error) {
    switch (error.code) {
      case "user-not-found":
        throw Exception('Usuario no encontrado.');
      default:
        throw 'Intentalo de nuevo';
    }
  }
}

Future<bool> signOut() async {
  await _auth.signOut();
  return true;
}
