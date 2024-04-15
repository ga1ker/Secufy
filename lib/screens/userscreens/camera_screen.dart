import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:secufy_app/screens/userscreens/photos_screen.dart';
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
  late DatabaseReference _database;
  String imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/secufy-3c114.appspot.com/o/Stream%2Fstream.jpg?alt=media&token=18d290cb-469f-4588-b35f-d68698e967e2';

  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase.instance.ref().child('Camera');
    _listenToDatabase();
  }

  void _listenToDatabase() {
    _database.onValue.listen((event) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        final Map<dynamic, dynamic>? data =
            event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          setState(() {
            isDynamicCameraEnabled = data['sensor'] ?? false;
            isAlarmEnabled = data['movimiento'] ?? false;
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhotosScreen()));
              },
              child: Icon(Icons.photo),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ForcePicRefresh(),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Detección de movimiento',
                    style: TextStyle(color: Colors.white)),
                Switch(
                  value: isDynamicCameraEnabled,
                  onChanged: toggleDynamicCamera,
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
            SizedBox(height: 200),
          ],
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}

class ForcePicRefresh extends StatefulWidget {
  @override
  _ForcePicRefreshState createState() => _ForcePicRefreshState();
}

class _ForcePicRefreshState extends State<ForcePicRefresh> {
  String url =
      'https://firebasestorage.googleapis.com/v0/b/secufy-3c114.appspot.com/o/Stream%2Fstream.jpg?alt=media&token=a81790e8-1d2a-4ca9-bab3-9035b4134a43';
  late Widget _pic;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pic = Image.network(url);
    _timer = Timer.periodic(
        Duration(milliseconds: 200), (Timer t) => _updateImgWidget());
  }

  _updateImgWidget() async {
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    if (mounted) {
      setState(() {
        _pic = Image.memory(bytes);
      });
    }
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _pic,
      onTap: () {
        _updateImgWidget();
      },
    );
  }
}
