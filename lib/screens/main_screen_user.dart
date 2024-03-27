import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secufy_app/screens/notifications_screen.dart';
import 'package:secufy_app/screens/user_settings_screen.dart';
import 'package:secufy_app/theme/app_theme.dart';

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({Key? key}) : super(key: key);

  @override
  State<MainUserScreen> createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  int selectedIndex = 0;

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
            selectedIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()));
            break;
          case 2:
            selectedIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserSettingsScreen()));
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cámaras',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Acción para el botón de búsqueda
              print('Acción de búsqueda');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: 300,
                child: Card(
                  color: Colors.white, // Cambiado a color blanco
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text(
                          'Cámara 1',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print('Camara 1');
                          },
                          child: Text('Ver cámara'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: AppTheme.mainColor,
        onTap: (index) => openScreen(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_outdoor,
              color: AppTheme.negro,
            ),
            label: "Camaras",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: AppTheme.negro,
            ),
            label: "Notificaciones",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
              color: AppTheme.negro,
            ),
            label: "Usuario",
          ),
        ],
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
