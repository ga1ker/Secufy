import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  void _submitForm(BuildContext context) {
    String email = _emailController.text;
    // Aquí podrías implementar la lógica para enviar un correo de recuperación de contraseña
    print('Correo Electrónico para recuperación de contraseña: $email');

    // Aquí podrías mostrar un mensaje de éxito o error, o redirigir a otra pantalla
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
