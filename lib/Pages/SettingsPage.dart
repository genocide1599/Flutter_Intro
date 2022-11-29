import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/LoginPage.dart';
import 'package:flutter_intro/Services/AuthService.dart';
import 'package:flutter_intro/Widgets/PrimaryButton.dart';

class SettingsPage extends StatefulWidget {
  static String routeName = "/settings";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: PrimaryButton(
            text: "Logout",
            icon: Icons.logout,
            onPress: () {
              logout();
            },
            height: 50,
            width: 200,
            color: Colors.red),
      ),
    );
  }

  void logout() async {
    try {
      await _authService.logOut();

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginPage.routeName, (Route<dynamic> route) => false);
    } catch (e) {
      const Text("Something went wrong");
    }
  }
}
