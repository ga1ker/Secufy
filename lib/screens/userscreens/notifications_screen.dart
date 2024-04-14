import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';
import 'package:secufy_app/screens/userscreens/user_settings_screen.dart';
import 'package:secufy_app/theme/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final DatabaseReference _fotoMoviRef =
      FirebaseDatabase.instance.ref().child('Camera/notifi/fotoMovi');
  final DatabaseReference _fotoUserRef =
      FirebaseDatabase.instance.ref().child('Camera/notifi/fotoUser');
  List<Map<String, String>> notifications = [];

  @override
  void initState() {
    super.initState();
    _fotoMoviRef.onValue.listen((event) {
      var data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          data.forEach((key, value) {
            String message;
            if (value['type'] == 'movimiento') {
              message = 'Movimiento detectado';
            } else if (value['type'] == 'fotoUser') {
              message = 'Foto tomada por el usuario';
            } else {
              message = 'Tipo de notificación desconocido';
            }
            notifications
                .add({'id': key, 'type': value['type'], 'message': message});
          });
        });
      }
    });

    _fotoUserRef.onValue.listen((event) {
      var data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          data.forEach((key, value) {
            String message;
            if (value['type'] == 'movimiento') {
              message = 'Movimiento detectado';
            } else if (value['type'] == 'fotoUser') {
              message = 'Foto tomada por el usuario';
            } else {
              message = 'Tipo de notificación desconocido';
            }
            notifications
                .add({'id': key, 'type': value['type'], 'message': message});
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]['message'] ?? ''),
            subtitle: Text(notifications[index]['type'] == 'fotoUser'
                ? 'Foto tomada por el usuario'
                : 'Movimiento detectado'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            1, // Asegúrate de que la pantalla de notificaciones esté seleccionada
        backgroundColor: AppTheme.negro,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainUserScreen()));
              break;
            case 1:
              // No necesitas hacer nada aquí ya que ya estás en la pantalla de notificaciones
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserSettingsScreen()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: AppTheme.blanco,
            ),
            label: "Camaras",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: AppTheme.blanco,
            ),
            label: "Notificaciones",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: AppTheme.blanco,
            ),
            label: "Usuario",
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
      ),
      backgroundColor: AppTheme.backColor,
    );
  }
}
