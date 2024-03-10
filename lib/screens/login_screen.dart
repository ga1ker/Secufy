import 'package:flutter/material.dart';
import 'package:secufy_app/screens/forgot_password.dart';
import 'package:secufy_app/screens/register_screen.dart';
import 'package:secufy_app/theme/app_theme.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordrouteController = TextEditingController();

  bool _isLoading = false;
  bool _obscureText = true;

  void _submitForm() {
    String email = _emailController.text;
    String passwordroute = _passwordrouteController.text;

    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
      print('Correo Electrónico: $email, Contraseña: $passwordroute');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Iniciar Sesión',
                style: AppTheme.lightTheme.textTheme.titleLarge,
              ),
              SizedBox(
                height: 150,
                width: 250,
                child: Image.asset(
                  'assets/imgs/secufy_logo.jpg',
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  hintText: 'ejemplo@gmail.com',
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
              TextField(
                controller: _passwordrouteController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              GestureDetector(
                  onTap: () {
                    final passwordRoute = MaterialPageRoute(builder: (context) {
                      return ForgotPasswordScreen();
                    });
                    Navigator.push(context, passwordRoute);
                  },
                  child: Text('Olvidé mi contraseña')),
              SizedBox(height: 20.0),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Iniciar sesión'),
                    ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  final registerRoute = MaterialPageRoute(builder: (context) {
                    return RegisterForm();
                  });
                  Navigator.push(context, registerRoute);
                },
                child: const Text(
                  'No tengo cuenta',
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
