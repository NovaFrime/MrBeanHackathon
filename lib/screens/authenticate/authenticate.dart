import 'package:flutter/material.dart';
import 'package:mrbeanhackathon/pages/login_page.dart';
import 'package:mrbeanhackathon/pages/register_page.dart';
class Authenticate extends StatefulWidget {

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage(toggledView: toggleView);
    } else
      return RegisterPage(toggledView: toggleView);
  }
}
