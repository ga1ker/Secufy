import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:secufy_app/screens/initialscreens/main_screen.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});
  FirebaseMessaging get _firebaseMessaging => FirebaseMessaging.instance;
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      // Si onMessage es activado con una notificación, construimos nuestra notificación local.
      if (notification != null && android != null) {
        print('A new onMessage event was published!');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      String? screen = message.data['screen'];

      if (screen != null) {
        if (screen == 'camera_screen') {
          Navigator.of(context).pushNamed('camera_screen');
        }
      }
    });

    databaseReference.child('Camera/movimiento').onValue.listen((event) {
      var snapshot = event.snapshot;

      if (snapshot.value == true) {
        FirebaseMessaging.instance.getToken().then((String? token) {
          assert(token != null);
          print("Push Messaging token: $token");
        });
      }
    });

    var user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? const MainUserScreen() : const MainScreen(),
    );
  }
}
