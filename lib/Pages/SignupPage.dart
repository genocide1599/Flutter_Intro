import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/LoginPage.dart';
import 'package:flutter_intro/Widgets/CustomTextField.dart';
import 'package:flutter_intro/Widgets/PasswordField.dart';
import 'package:flutter_intro/Widgets/PrimaryButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_intro/Services/PassAuth.dart';

class SignupPage extends StatefulWidget {
  static String routeName = "/signup";
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConPassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: width * .85,
              child: Column(
                children: [
                  const Text("SIGN UP"),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      label: "First Name",
                      hint: "enter first name",
                      controller: fnameController,
                      inputType: TextInputType.name),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      label: "Last Name",
                      hint: "enter last name",
                      controller: lnameController,
                      inputType: TextInputType.name),
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
                  PasswordField(
                      obscureText: obscureConPassword,
                      onTap: handleObscureConPassword,
                      label: "Confirm Password",
                      hint: "enter password again",
                      controller: conPasswordController),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                      text: "Sign Up",
                      icon: Icons.thumb_up,
                      onPress: () {
                        if (checkPasswords() == true) {
                          try {
                            PassAuth().createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: conPasswordController.text);

                            Navigator.pushReplacementNamed(
                                context, LoginPage.routeName);
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          print("Passwords do not match");
                        }
                      },
                      height: 50,
                      width: 200,
                      color: Colors.green),
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                      text: "Login",
                      icon: Icons.login,
                      onPress: () {
                        Navigator.pushReplacementNamed(
                            context, LoginPage.routeName);
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
    );
  }

  void handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void handleObscureConPassword() {
    setState(() {
      obscureConPassword = !obscureConPassword;
    });
  }

  bool checkPasswords() {
    if (passwordController.text == conPasswordController.text) {
      return true;
    } else {
      return false;
    }
  }
}
