import 'package:flutter/material.dart';
import 'package:flutter_forum/Views/auth/registration_component.dart';

import 'login_component.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _loginPageEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text("Auth-Page"),
        centerTitle: true,
        elevation: 4,
        actions: <Widget>[_authIconButton()],
      ),
      body: _authPage()
    );
  }

  Widget _authIconButton(){
    if (_loginPageEnabled) {
      return IconButton(
        onPressed: (){setState(() { _loginPageEnabled = false; });},
        icon: Icon(Icons.app_registration),
        tooltip: 'Registration',
      );
    }
      return IconButton(
        onPressed: (){setState(() { _loginPageEnabled = true; });},
        icon: Icon(Icons.login),
        tooltip: 'Login',
      );
  }

  Widget _authPage(){
    if (_loginPageEnabled) {
      return LoginComponent();
    }
    return RegistrationComponent();
  }
}
