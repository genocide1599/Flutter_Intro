import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/SettingsPage.dart';
import 'package:flutter_intro/Widgets/ScreenArguments.dart';

class DashboardPage extends StatefulWidget {
  static String routeName = "/dashboard";
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.settings, size: 30),
            ),
          )
        ],
      ),
      body: Center(
        child: Text(args.email.text, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
