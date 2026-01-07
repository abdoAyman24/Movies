
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/core/error/custom_fire_base_excption.dart';

class FireBaseAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomFireBaseExcption(
          errorMessage: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomFireBaseExcption(
          errorMessage: 'The account already exists for that email.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomFireBaseExcption(
          errorMessage: 'check connection the intenet',
        );
      } else if (e.code == 'invalid-email') {
        throw CustomFireBaseExcption(
          errorMessage: 'The email address is badly formatted.',
        );
      } else {
        throw CustomFireBaseExcption(
          errorMessage: 'there is problem,try again later ${e.toString()}',
        );
      }
    } catch (e) {
      throw CustomFireBaseExcption(errorMessage: e.toString());
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomFireBaseExcption(
          errorMessage: 'User Or Password not Correct.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomFireBaseExcption(
          errorMessage: 'User Or Password not Correct.',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomFireBaseExcption(
          errorMessage: 'User Or Password not Correct.',
        );
      } else {
        throw CustomFireBaseExcption(
          errorMessage:
              'this is A problem,please try again later${e.credential}',
        );
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // 1️⃣ تسجيل الدخول في حساب Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      throw CustomFireBaseExcption(errorMessage: 'تم إلغاء تسجيل الدخول');
    }

    // 2️⃣ الحصول على التوكين من Google
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // 3️⃣ إنشاء credential لـ Firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 4️⃣ تسجيل الدخول في Firebase
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
