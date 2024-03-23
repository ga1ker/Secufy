import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class RecoveryScreen extends StatelessWidget {
  final TextEditingController _recoveryCodeController = TextEditingController();

  void _submitForm(BuildContext context) {
    String recoveryCode = _recoveryCodeController.text;

    print('Código de recuperación: $recoveryCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperación de Contraseña'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingrese el código de recuperación',
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
            SizedBox(height: 50),
            TextField(
              controller: _recoveryCodeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'Código de Recuperación',
                hintText: '123456',
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
