import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill in email");
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: "You need to fill in password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email");
            return;
          }
          var user = credential.user;
          if (user != null) {
            print("user exist");
          } else {
            toastInfo(msg: "You are not a user");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Wrong email format");
            return;
          }
        }
      }
    } catch (e) {}
  }
}
