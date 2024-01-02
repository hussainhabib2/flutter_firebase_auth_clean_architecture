import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_clean_architecture/domain/repository/firebase_repository.dart';

class FirebaseRepositoryImp extends FirebaseRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  FirebaseRepositoryImp(
      {required this.firebaseFirestore, required this.firebaseAuth});

  @override
  Future<bool> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return Future<bool>.value(userCredential.user != null);
    } on FirebaseAuthException catch (_) {
      return Future<bool>.value(false);
    }
  }

  @override
  Future<bool> checkUser(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      return Future<bool>.value(querySnapshot.docs.isNotEmpty);
    } on FirebaseAuthException catch (e) {
      return Future<bool>.value(false);
    } catch (e) {
      return Future<bool>.value(false);
    }
  }

  @override
  Future<bool> signUpUser(String email, String name, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'name': name,
          'email': email,
        });

        return Future<bool>.value(true);
      } else {
        return Future<bool>.value(false);
      }
    } on FirebaseAuthException catch (e) {
      return Future<bool>.value(false);
    } catch (e) {
      return Future<bool>.value(false);
    }
  }
}
