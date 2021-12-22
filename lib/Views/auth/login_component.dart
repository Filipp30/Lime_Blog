import 'package:flutter/material.dart';
import 'package:flutter_forum/Models/user_model.dart';
import 'package:flutter_forum/Providers/auth_provider.dart';
import 'package:flutter_forum/Views/forum/home_view.dart';
import 'package:provider/provider.dart';
class LoginComponent extends StatelessWidget {
  static const routeName = 'login-component';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submitLogin(context) async{
    final authProvider = Provider.of<AuthBase>(context, listen: false);
    final user = UserModel(email: _emailController.text, password: _passwordController.text);
    var response = authProvider.login(user);
    print('login component response : ${response.toString()}');
    Navigator.of(context).pushNamed(Home.routeName);
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
          _buildPasswordTextField(context),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: ()=> _submitLogin(context),
          )
        ],
      ),
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

  TextField _buildPasswordTextField(BuildContext context) {
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
      onEditingComplete: ()=> _submitLogin(context),
    );
  }
}