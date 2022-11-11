import 'package:flutter/material.dart';
import 'package:flutter_intro/Pages/LoginPage.dart';
import 'package:flutter_intro/routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: LoginPage.routeName,
    routes: routes,
  ));
}
