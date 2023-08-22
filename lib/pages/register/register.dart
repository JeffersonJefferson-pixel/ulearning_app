import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_states.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: reusableText(
                    "Enter your details below and free sign up",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Username"),
                      buildTextField(
                        "Enter your username",
                        "Name",
                        "name",
                        "user",
                        (value) {
                          // context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText("Email"),
                      buildTextField(
                        "Enter your email address",
                        "Email",
                        "email",
                        "user",
                        (value) {
                          // context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText("Password"),
                      buildTextField(
                        "Enter your password",
                        "Password",
                        "password",
                        "lock",
                        (value) {
                          // context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                      reusableText("Re-enter your password"),
                      buildTextField(
                        "Re-enter your password",
                        "Password",
                        "password",
                        "lock",
                        (value) {
                          // context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child:
                      reusableText("Enter your detials below and free sign up"),
                ),
                buildAuthButton(
                  "Sign Up",
                  "login",
                  () {
                    // Navigator.of(context).pushNamed("register");
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
