import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class AddCameraScreen extends StatefulWidget {
  @override
  _AddCameraScreenState createState() => _AddCameraScreenState();
}

class _AddCameraScreenState extends State<AddCameraScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar cámara',
          style: TextStyle(
            // Estilo del título del AppBar
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de la cámara',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el nombre de la cámara';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Clave de la cámara',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la clave de la cámara';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Aquí puedes manejar la lógica para registrar la cámara
                      String name = _nameController.text;
                      String password = _passwordController.text;

                      // Ejemplo de impresión de los datos
                      print('Nombre de la cámara: $name');
                      print('Clave de la cámara: $password');

                      // Puedes añadir más lógica aquí, como enviar los datos a una API, etc.
                    }
                  },
                  child: Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppTheme.backColor,
    );
  }
}
