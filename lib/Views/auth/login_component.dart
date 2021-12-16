import 'package:flutter/material.dart';

class LoginComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
            child: Login()
        ),
      ) ,
    );
  }
}

class Login extends StatelessWidget {
  bool _isLoading = false;
  void _submitLogin(){

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildEmailTextField(),
          const SizedBox(height: 8),
          _buildPasswordTextField(),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: _submitLogin,
          )
        ],
      ),
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = false;
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: '.......@......com',
        errorText: showErrorText ? 'Email is required' : null,
        enabled: _isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  TextField _buildPasswordTextField() {
    bool showErrorText = false;
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: showErrorText ? 'Password is required' : null,
        enabled: _isLoading == false,
      ),
      autocorrect: false,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submitLogin,
    );
  }
}