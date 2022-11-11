import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/DashboardPage.dart';
import 'package:flutter_intro/Pages/SignupPage.dart';
import 'package:flutter_intro/Widgets/CustomTextField.dart';
import 'package:flutter_intro/Widgets/PasswordField.dart';
import 'package:flutter_intro/Widgets/PrimaryButton.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .85,
                child: Column(
                  children: [
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
                          Navigator.pushNamed(context, DashboardPage.routeName);
                        },
                        height: 50,
                        width: 200,
                        color: Colors.green),
                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                        text: "Sign Up",
                        icon: Icons.thumb_up,
                        onPress: () {
                          Navigator.pushNamed(context, SignupPage.routeName);
                        },
                        height: 50,
                        width: 100,
                        color: Colors.grey)
                  ],
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
}
