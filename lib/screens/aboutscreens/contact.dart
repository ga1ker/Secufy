import 'package:flutter/material.dart';
import 'package:secufy_app/theme/app_theme.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contáctanos',
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
        backgroundColor: AppTheme.backColor,
        iconTheme: IconThemeData(color: AppTheme.blanco),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  'Si tienes dudas o necesitas ayuda o soporte técnico, puedes contactarte con nosotros a través de:',
                  style: AppTheme.lightTheme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/imgs/wasap.png',
                              height: 60,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'WhatsApp',
                              style: AppTheme.lightTheme.textTheme.bodyMedium,
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              '2471327625',
                              style: AppTheme.lightTheme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      child: SizedBox(
                        width: 180,
                        height: 150,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.email_rounded,
                              size: 60,
                              color: AppTheme.blanco,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Email',
                              style: AppTheme.lightTheme.textTheme.bodyMedium,
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              'secufyoficial@gmail.com',
                              style: AppTheme.lightTheme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  borderOnForeground: true,
                  elevation: 2,
                  color: Colors.transparent,
                  child: SizedBox(
                    height: 100,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/imgs/insta.png',
                          width: 50,
                        ),
                        Text(
                          '@secufyoficial',
                          style: AppTheme.lightTheme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  borderOnForeground: true,
                  elevation: 2,
                  color: Colors.transparent,
                  child: SizedBox(
                    height: 100,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/imgs/face.png',
                          width: 50,
                        ),
                        Text(
                          'Secufy',
                          style: AppTheme.lightTheme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppTheme.backColor,
    );
  }
}
