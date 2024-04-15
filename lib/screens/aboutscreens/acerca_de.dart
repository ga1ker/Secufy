import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCard(
              title: 'Ismael Otamendi Sanchez',
              content:
                  'Encargado de desarrollar página web, Dispositivo IoT, estructura de base de datos y ayuda a la app',
              imagePath: 'assets/imgs/ismael.jpg',
              username: '@ismontanaomg',
            ),
            _buildCard(
              title: 'Gadiel Alcazar Bernal',
              content:
                  'Encargado de desarrollar la aplicacón móvil de este proyecto y ayuda al diseño de página web',
              imagePath: 'assets/imgs/gadiel.jpg',
              username: '@gadiel.ab',
            ),
            _buildCard(
              title: 'Luis Ándres Medel Recendis',
              content: 'Encargado de documentación y apoyo con la página web',
              imagePath: 'assets/imgs/medel.jpg',
              username: '@luis_medel_5',
            ),
            _buildCard(
              title: 'Ángel Ruíz Lozano',
              content: 'Encargado de documentación',
              imagePath: 'assets/imgs/angel.jpg',
              username: '@Lozano3078',
            ),
            _buildCard(
              title: 'App Secufy',
              content:
                  'La aplicación móvil de Secufy ofrece una gama completa de funcionalidades diseñadas para brindar a los usuarios un control integral sobre su sistema de seguridad.\nCon la función de monitoreo en tiempo real, los usuarios pueden visualizar las imágenes capturadas por las cámaras del sistema directamente desde sus dispositivos móviles, lo que proporciona una vigilancia constante y la capacidad de responder rápidamente ante cualquier evento de seguridad. Además, la capacidad de control remoto permite a los usuarios activar o desactivar el sistema de seguridad con la conveniencia de su teléfono móvil.\nPara una gestión eficaz, la aplicación registra detalladamente todos los eventos de seguridad, lo que permite a los usuarios revisar la actividad pasada y tomar medidas apropiadas según sea necesario. \nEn resumen, la aplicación móvil de Secufy ofrece una experiencia completa y efectiva para la gestión y monitoreo del sistema de seguridad, garantizando la protección y tranquilidad de los usuarios en todo momento.',
            ),
          ],
        ),
      ),
      backgroundColor: AppTheme.backColor,
    );
  }

  Widget _buildCard(
      {required String title,
      required String content,
      String? imagePath,
      String? username}) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: AppTheme.backColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            if (username != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  username,
                  style: TextStyle(
                    color: Colors.white
                        .withOpacity(0.5), // Ajusta la opacidad aquí
                    fontSize: 12,
                  ),
                ),
              ),
            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 50,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
