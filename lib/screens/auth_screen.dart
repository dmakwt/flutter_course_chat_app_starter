import 'package:flutter/material.dart';
import 'package:flutter_course_chat_app_starter/controller/auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPES'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Email Address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Required';
                    }
                    return null;
                  },
                ),
              ),
              Container(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Required';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 120,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 1
                    Auth().login(
                      context,
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
              Container(
                width: 120,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 2
                    Auth().signup(
                      context,
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  child: const Text('Sign Up'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
