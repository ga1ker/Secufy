// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secufy_app/screens/initialscreens/login_screen.dart';
import 'package:secufy_app/screens/aboutscreens/terms_screen.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';
import 'package:secufy_app/services/auth_google.dart';
import 'package:secufy_app/theme/app_theme.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _hardwareCodeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _obscureText = true;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registrar Usuario',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(35, 50, 35, 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Nombre',
                    hintText: 'Juan Pérez',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Correo Electrónico',
                    hintText: 'ejemplo@gmail.com',
                    suffixIcon: Icon(Icons.email_outlined),
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Por favor ingresa un correo electrónico válido';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    if (value.length < 8 || !value.contains(RegExp(r'\d'))) {
                      return 'Debe tener al menos 8 caracteres y un número';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _hardwareCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Código de la cámara',
                    hintText: 'ABC123',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  maxLength: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'Acepto los ',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            final terms = MaterialPageRoute(builder: (context) {
                              return TermsAndConditionsScreen();
                            });
                            Navigator.push(context, terms);
                          },
                          child: Text(
                            'términos y condiciones',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _signUp,
                        child: Text('Registrar'),
                      ),
                SizedBox(height: 50),
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
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      if (!_isChecked) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Aviso'),
            content: Text('Debes aceptar los términos y condiciones.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String hardwareCode = _hardwareCodeController.text;

      setState(() {
        _isLoading = true;
      });

      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        await user.updateDisplayName(name);

        print('Usuario creado correctamente');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainUserScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Este correo electrónico ya está registrado'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }
}
