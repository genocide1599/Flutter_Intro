import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/DashboardPage.dart';
import 'package:flutter_intro/Pages/SignupPage.dart';
import 'package:flutter_intro/Services/AuthService.dart';
import 'package:flutter_intro/Widgets/CustomTextField.dart';
import 'package:flutter_intro/Widgets/PasswordField.dart';
import 'package:flutter_intro/Widgets/PrimaryButton.dart';
import 'package:flutter_intro/Widgets/ScreenArguments.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isLogIn = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Center(
          child: ModalProgressHUD(
            inAsyncCall: isLogIn,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  width: width * .85,
                  child: Column(
                    children: [
                      const Text("LOG IN"),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          label: "Email Address",
                          hint: "enter email",
                          controller: emailController,
                          inputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordField(
                          obscureText: obscurePassword,
                          onTap: handleObscurePassword,
                          label: "Password",
                          hint: "enter password",
                          controller: passwordController),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                          text: "Login",
                          icon: Icons.login,
                          onPress: () {
                            loginWithPasswordAuth();
                          },
                          height: 50,
                          width: 240,
                          color: Colors.green),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("OR"),
                      const SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                          text: "Login with Google",
                          icon: Icons.login_sharp,
                          onPress: () {
                            //loginWithProvider();
                          },
                          height: 50,
                          width: 240,
                          color: Colors.black),
                      const SizedBox(
                        height: 40,
                      ),
                      PrimaryButton(
                          text: "Sign Up",
                          icon: Icons.thumb_up,
                          onPress: () {
                            Navigator.pushReplacementNamed(
                                context, SignupPage.routeName);
                          },
                          height: 50,
                          width: 200,
                          color: Colors.grey)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void loginWithProvider() async {
    try {
      setState(() {
        isLogIn = true;
      });

      var user = await _authService.signInWithGoogle();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, DashboardPage.routeName,
          arguments: ScreenArguments(emailController.value));
    } catch (e) {
      const Text("Something went wrong");
    }

    setState(() {
      isLogIn = false;
    });
  }

  void loginWithPasswordAuth() async {
    try {
      setState(() {
        isLogIn = true;
      });

      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.value.toString(),
          password: passwordController.value.toString(),
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, DashboardPage.routeName,
            arguments: ScreenArguments(emailController.value));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } catch (e) {
      const Text("Something went wrong");
    }

    setState(() {
      isLogIn = false;
    });
  }
}
