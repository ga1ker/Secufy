import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Términos y Condiciones'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Términos y Condiciones de Uso de la Aplicación Secufy',
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
            SizedBox(height: 10.0),
            Text(
              'Por favor, lee detenidamente estos términos y condiciones de uso ("Términos") antes de utilizar la aplicación móvil Secufy y sus servicios relacionados. Estos Términos establecen los términos y condiciones legalmente vinculantes para el uso de la Aplicación.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Aceptación de los Términos',
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
            SizedBox(height: 10.0),
            Text(
              'Al utilizar la Aplicación, aceptas cumplir y estar sujeto a estos Términos. Si no estás de acuerdo con alguno de los términos establecidos en este documento, no utilices la Aplicación.',
            ),
            // Resto de los términos y condiciones...
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresar al registro
              },
              child: Text('Regresar al Registro'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TermsAndConditionsScreen(),
  ));
}
