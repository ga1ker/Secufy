import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secufy_app/theme/app_theme.dart';

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({Key? key}) : super(key: key);

  @override
  State<MainUserScreen> createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cámaras',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 140,
                width: 200,
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
                          height: 10,
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
