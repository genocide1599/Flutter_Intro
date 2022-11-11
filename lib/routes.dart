import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/DashboardPage.dart';
import 'package:flutter_intro/Pages/LoginPage.dart';
import 'package:flutter_intro/Pages/SettingsPage.dart';
import 'package:flutter_intro/Pages/SignupPage.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (BuildContext context) => const LoginPage(),
  SignupPage.routeName: (BuildContext context) => const SignupPage(),
  DashboardPage.routeName: (BuildContext context) => const DashboardPage(),
  SettingsPage.routeName: (BuildContext context) => const SettingsPage(),
};
