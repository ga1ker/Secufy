import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';
import 'package:secufy_app/screens/userscreens/user_settings_screen.dart';
import 'package:secufy_app/theme/app_theme.dart';
import 'image_mov_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final DatabaseReference _fotoMoviRef =
      FirebaseDatabase.instance.ref().child('Camera/notifi/fotoMovi');
  List<String> notifications = [];

  @override
  void initState() {
    super.initState();
    _fotoMoviRef.onValue.listen((event) {
      var data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          notifications.addAll(data.keys.toList().cast<String>());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final reversedNotifications = notifications.reversed.toList();
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 0.0), // Espaciado vertical entre elementos
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: const Icon(Icons.warning,
                    color: Colors.red), // Icono de precaución en rojo
                title: const Text(
                  "Movimiento detectado",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(reversedNotifications[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(5), // Bordes redondeados
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/secufy-3c114.appspot.com/o/Movimiento%2F" +
                            reversedNotifications[index] +
                            ".jpg?alt=media&token=7e39c3bb-49eb-49fd-b6b0-8eb49bcd5447",
                        width: 60, // Ajusta el tamaño según sea necesario
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  String imageUrl =
                      "https://firebasestorage.googleapis.com/v0/b/secufy-3c114.appspot.com/o/Movimiento%2F" +
                          reversedNotifications[index] +
                          ".jpg?alt=media&token=7e39c3bb-49eb-49fd-b6b0-8eb49bcd5447";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageMovScreen(imageUrl: imageUrl),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: AppTheme.negro,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainUserScreen(),
                ),
              );
              break;
            case 1:
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserSettingsScreen()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: AppTheme.unactive,
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
              color: AppTheme.unactive,
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

void _showImageDialog(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 248,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );
    },
  );
}
