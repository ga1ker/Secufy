import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secufy_app/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Importa Firebase Messaging
import 'package:secufy_app/main_app.dart';
import 'package:secufy_app/services/push_notifications_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa el servicio de notificaciones push
  await PushNotificationsService.initializeApp();

  // Inicializa Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Configura el manejo de notificaciones
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MainApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Aquí puedes manejar las notificaciones entrantes cuando la aplicación está en segundo plano
  print("Mensaje recibido en segundo plano: ${message.messageId}");
}
