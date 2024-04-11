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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Acerca de:',
                style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppTheme.backColor,
    );
  }
}
