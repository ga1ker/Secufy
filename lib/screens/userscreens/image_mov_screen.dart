import 'package:flutter/material.dart';

class ImageMovScreen extends StatelessWidget {
  final String imageUrl;

  ImageMovScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto del Movimiento'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
