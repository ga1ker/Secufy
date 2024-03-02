import 'package:flutter/material.dart';
import 'package:secufy_app/screens/login_screen.dart';
import 'package:secufy_app/screens/terms_screen.dart';
import 'package:secufy_app/theme/app_theme.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _hardwareCodeController = TextEditingController();

  bool _isLoading = false;
  bool _obscureText = true;

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String phone = _phoneController.text;
    String hardwareCode = _hardwareCodeController.text;

    setState(() {
      _isLoading = true;
    });

    // Simulate registration process
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
      print('Nombre: $name');
      print('Correo Electrónico: $email');
      print('Contraseña: $password');
      print('Teléfono: $phone');
      print('Código de Hardware: $hardwareCode');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Registrar Usuario',
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Juan Pérez',
              ),
              style: AppTheme.lightTheme.textTheme.bodySmall,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                hintText: 'ejemplo@gmail.com',
                suffixIcon: Icon(Icons.email_outlined),
              ),
              style: AppTheme.lightTheme.textTheme.bodySmall,
            ),
            SizedBox(height: 20),
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
              style: AppTheme.lightTheme.textTheme.bodySmall,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Número de Teléfono',
                hintText: '1234567890',
              ),
              keyboardType: TextInputType.phone,
              style: AppTheme.lightTheme.textTheme.bodySmall,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _hardwareCodeController,
              decoration: const InputDecoration(
                labelText: 'Código de la cámara',
                hintText: 'ABC123',
              ),
              style: AppTheme.lightTheme.textTheme.bodySmall,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                final terms = MaterialPageRoute(builder: (context) {
                  return TermsAndConditionsScreen();
                });
                Navigator.push(context, terms);
              },
              child: Text(
                'Terminos y condiciones',
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Registrar'),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm()),
                );
              },
              child: Text('Regresar a login'),
            ),
          ],
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
