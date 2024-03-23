import 'package:flutter/material.dart';
import 'package:secufy_app/screens/recovery_password.dart';
import 'package:secufy_app/theme/app_theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Expresión regular para validar el formato de correo electrónico

  void _submitForm(BuildContext context) {
    String email = _emailController.text;

    if (email.isEmpty || !emailRegExp.hasMatch(email)) {
      // Si el correo electrónico está vacío o no es válido, muestra un mensaje de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor, ingrese un correo electrónico válido.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Si el correo electrónico es válido, navega a la pantalla de recuperación
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecoveryScreen()),
      );
      print('correo de recuperación $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olvidé mi contraseña'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingrese su correo electrónico',
              style: AppTheme.lightTheme.textTheme.titleLarge,
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
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _submitForm(context),
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
