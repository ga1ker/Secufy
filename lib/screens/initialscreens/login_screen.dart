import 'package:flutter/material.dart';
import 'package:secufy_app/screens/initialscreens/forgot_password.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';
import 'package:secufy_app/screens/initialscreens/register_screen.dart';

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

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/imgs/background_main.png"), // Ruta de la imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/imgs/secufy_texto.png',
                  ),
                ),
                SizedBox(height: 75),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Correo Electrónico',
                    hintText: 'ejemplo@gmail.com',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.email_outlined, color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: Colors.white,
                      onPressed: () {
                        setState(
                          () {
                            _obscureText = !_obscureText;
                          },
                        );
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    password = value!;
                  },
                  style: TextStyle(color: Colors.white),
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
                  child: Text(
                    'Olvidé mi contraseña',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 50.0),
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
                  child: Text(
                    'No tengo cuenta',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
      ),
      backgroundColor:
          Colors.transparent, // Establece el color de fondo transparente
    );
  }
}
