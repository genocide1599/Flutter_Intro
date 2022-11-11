import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/LoginPage.dart';
import 'package:flutter_intro/Widgets/PrimaryButton.dart';

class SettingsPage extends StatefulWidget {
  static String routeName = "/settings";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              Navigator.pushNamed(context, LoginPage.routeName);
            },
            height: 50,
            width: 200,
            color: Colors.red),
      ),
    );
  }
}
