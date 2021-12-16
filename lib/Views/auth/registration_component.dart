import 'package:flutter/material.dart';

  class RegistrationComponent extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            child: Registration()
          ),
        ) ,
      );
    }
  }

  class Registration extends StatelessWidget {
    bool _isLoading = false;
    void _submitRegistration(){

    }
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Registration', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildUserNameTextField(),
            const SizedBox(height: 8),
            _buildEmailTextField(),
            const SizedBox(height: 8),
            _buildPasswordTextField(),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text('Submit Registration'),
                onPressed: _submitRegistration,
            )
          ],
        ),
      );
    }

    TextField _buildUserNameTextField() {
      bool showErrorText = false;
      return TextField(
          decoration: InputDecoration(
            labelText: 'User name',
            errorText: showErrorText ? 'Username is required' : null,
            enabled: _isLoading == false,
          ),
        autocorrect: false,
        textInputAction: TextInputAction.next,
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
        onEditingComplete: _submitRegistration,
      );
    }
  }


