import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:secufy_app/screens/initialscreens/main_screen.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    databaseReference.child('Camera/movimiento').onValue.listen((event) {
      var snapshot = event.snapshot;

      if (snapshot.value == true) {
        var user = _auth.currentUser;
        if (user != null) {
          _sendEmail(user.email!);
        }
      }
    });

    var user = _auth.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? const MainUserScreen() : const MainScreen(),
    );
  }

  void _sendEmail(String userEmail) async {
    final smtpServer = gmail('secufyoficial@gmail.com', 'mbry mmfv kxhm zjmd');
    final message = Message()
      ..from = const Address('secufyoficial@gmail.com', 'Secufy')
      ..recipients.add(userEmail)
      ..subject = '¡Se detectó movimiento!'
      ..text = 'Se ha detectado movimiento en tu cámara.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email sent: ${sendReport.toString()}');
    } catch (error) {
      print('Error sending email: $error');
    }
  }
}
