import 'package:flutter/material.dart';
import 'package:flutter_forum/Models/user_model.dart';
import 'package:flutter_forum/Providers/auth_provider.dart';
import 'package:provider/provider.dart';

  class RegistrationComponent extends StatelessWidget {

    final Function registrationCompletedCallBack;

    const RegistrationComponent({required this.registrationCompletedCallBack});

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Registration(callBack: registrationCompletedCallBack)
          ),
        ) ,
      );
    }
}

  class Registration extends StatefulWidget {
    final Function callBack;
    const Registration({required this.callBack});
    @override
    State<Registration> createState() => _RegistrationState();
  }

  class _RegistrationState extends State<Registration> {
    bool _isLoading = false;
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    void _submitRegistration() async {
      setState(() { _isLoading = true; });
      final authProvider = Provider.of<AuthBase>(context, listen: false);
      try {
        final UserModel user = UserModel(userName: _userNameController.text, email: _emailController.text, password: _passwordController.text);
        final int response = await authProvider.createNewUser(user);
        if (response == 200) {
          widget.callBack();
        } else {
          print('Response code : ${response.toString()}');
        }
      } catch (e) {
        print(e.toString());
      } finally {
        setState(() { _isLoading = false; });
        _userNameController.clear();
        _emailController.clear();
        _passwordController.clear();
      }
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
        controller: _userNameController,
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
        controller: _emailController,
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
        controller: _passwordController,
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


