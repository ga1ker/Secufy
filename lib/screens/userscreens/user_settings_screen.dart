import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secufy_app/screens/aboutscreens/contact.dart';
import 'package:secufy_app/screens/initialscreens/main_screen.dart';
import 'package:secufy_app/screens/userscreens/main_screen_user.dart';
import 'package:secufy_app/screens/userscreens/notifications_screen.dart';
import 'package:secufy_app/services/auth_google.dart';
import 'package:secufy_app/theme/app_theme.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({Key? key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  int selectedIndex = 2;

  void openScreen(int index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainUserScreen()));
          break;
        case 1:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationsScreen()));
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String displayName = user?.displayName ?? '';
    String photoURL = user?.photoURL ?? 'assets/imgs/secufy_texto.png';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Mi cuenta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(photoURL),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(photoURL),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  displayName,
                  style: AppTheme.lightTheme.textTheme.bodyMedium,
                ),
              ),
              ListTile(
                title: Text('Ajustes',
                    style: AppTheme.lightTheme.textTheme.bodyMedium),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactScreen(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text('Contacto',
                      style: AppTheme.lightTheme.textTheme.bodyMedium),
                ),
              ),
              ListTile(
                title: Text('Acerca de',
                    style: AppTheme.lightTheme.textTheme.bodyMedium),
              ),
              ElevatedButton(
                onPressed: () async {
                  await UserController.signOut();
                  if (mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  }
                },
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: AppTheme.mainColor,
        onTap: (index) => openScreen(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_outdoor, color: AppTheme.negro),
            label: 'Cámaras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: AppTheme.negro),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, color: AppTheme.negro),
            label: 'Usuario',
          ),
        ],
      ),
      backgroundColor: AppTheme.backColor,
    );
  }
}
