import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class ViewCameraScreen extends StatelessWidget {
  final String cameraName;

  const ViewCameraScreen({Key? key, required this.cameraName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cameraName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Activar Alarma'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Activar Flash'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Apagar Cámara'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Tomar Foto'),
            ),
          ],
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
