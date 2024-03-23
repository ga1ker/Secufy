import 'package:flutter/material.dart';
import 'package:secufy_app/screens/forgot_password.dart';
import 'package:secufy_app/screens/main_screen_user.dart';
import 'package:secufy_app/screens/register_screen.dart';
import 'package:secufy_app/theme/app_theme.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscureText = true;

  void _submitForm() {
    String email = _emailController.text;
    String password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    // Simulating some asynchronous operation
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
      print('Correo Electrónico: $email, Contraseña: $password');
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
              SizedBox(
                height: 40,
              ),
              Text(
                'Iniciar Sesión',
                style: AppTheme.lightTheme.textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/imgs/logo_secu.png',
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
                controller: _passwordController,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()),
                  );
                },
                child: Text('Olvidé mi contraseña'),
              ),
              SizedBox(height: 20.0),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainUserScreen()),
                        );
                      },
                      child: Text('Iniciar sesión'),
                    ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterForm()),
                  );
                },
                child: const Text('No tengo cuenta'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
