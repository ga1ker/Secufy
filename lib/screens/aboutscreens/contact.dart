import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
        backgroundColor: AppTheme.backColor,
        iconTheme: IconThemeData(color: AppTheme.blanco),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Puedes comunicarte con nosotros en:',
                style: AppTheme.lightTheme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 100,
              ),
              ContactInfo(
                icon: Icons.mail,
                text: 'secufyoficial@gmail.com',
              ),
              ContactInfo(
                icon: Icons.phone,
                text: '+52 247 132 76 25',
              ),
              ContactInfo(
                icon: Icons.location_on,
                text: '8 Sur 48',
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.facebook,
                    color: AppTheme.blanco,
                  ),
                  Icon(
                    Icons.camera_alt,
                    color: AppTheme.blanco,
                  ),
                  Icon(
                    Icons.one_x_mobiledata,
                    color: AppTheme.blanco,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppTheme.backColor,
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfo({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppTheme.blanco,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
