import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secufy_app/screens/userscreens/add_camera_form.dart';
import 'package:secufy_app/screens/userscreens/camera_screen.dart';
import 'package:secufy_app/screens/userscreens/notifications_screen.dart';
import 'package:secufy_app/screens/userscreens/user_settings_screen.dart';
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
            null;
          case 1:
            selectedIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()));
            break;
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
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          user?.displayName ?? 'Camaras',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCameraScreen()),
              );
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
                width: 380,
                child: Card(
                  color: Colors.white,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewCameraScreen(
                                  cameraName: '',
                                ),
                              ),
                            );
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
        backgroundColor: AppTheme.negro,
        onTap: (index) => openScreen(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: AppTheme.blanco,
            ),
            label: "Camaras",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_outlined,
              color: AppTheme.unactive,
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
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
    );
  }
}
