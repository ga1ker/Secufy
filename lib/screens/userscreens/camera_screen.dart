import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:secufy_app/theme/app_theme.dart';

class ViewCameraScreen extends StatefulWidget {
  final String cameraName;

  const ViewCameraScreen({Key? key, required this.cameraName})
      : super(key: key);

  @override
  _ViewCameraScreenState createState() => _ViewCameraScreenState();
}

class _ViewCameraScreenState extends State<ViewCameraScreen> {
  bool isDynamicCameraEnabled = false;
  bool isAlarmEnabled = false;
  bool isTakingPhoto = false;

  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('Camara');

  @override
  void initState() {
    super.initState();
    _database.onValue.listen((event) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          setState(() {
            isDynamicCameraEnabled = data['sensor'] ?? false;
            isAlarmEnabled = data['alarma'] ?? false;
            isTakingPhoto = data['foto'] ?? false;
          });
        }
      }
    });
  }

  void toggleDynamicCamera(bool newValue) {
    setState(() {
      isDynamicCameraEnabled = newValue;
      _database.update({'sensor': isDynamicCameraEnabled});
    });
  }

  void toggleAlarm(bool newValue) {
    setState(() {
      isAlarmEnabled = newValue;
      _database.update({'alarma': isAlarmEnabled});
    });
  }

  void takePhoto() {
    setState(() {
      isTakingPhoto = true;
      _database.update({'foto': true});
    });

    Timer(Duration(seconds: 2), () {
      _database.update({'foto': false});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cameraName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cámara dinámica', style: TextStyle(color: Colors.white)),
                Switch(
                  value: isDynamicCameraEnabled,
                  onChanged: toggleDynamicCamera,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[300],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sonar Alarma', style: TextStyle(color: Colors.white)),
                Switch(
                  value: isAlarmEnabled,
                  onChanged: toggleAlarm,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[300],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: takePhoto,
              child: Text('Tomar Foto'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
