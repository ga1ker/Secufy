import 'package:flutter/material.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';
import 'package:secufy_app/screens/userscreens/user_settings_screen.dart';
import 'package:secufy_app/theme/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectedIndex = 1;

  void openScreen(int index) {
    setState(
      () {
        switch (index) {
          case 0:
            selectedIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainUserScreen()));
            break;
          case 1:
            null;
          case 2:
            selectedIndex = index;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserSettingsScreen()));
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Notificaciones'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListTile(
            title: Text(
              'hola',
              style: AppTheme.lightTheme.textTheme.bodyMedium,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: AppTheme.negro,
        onTap: (index) => openScreen(index),
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
