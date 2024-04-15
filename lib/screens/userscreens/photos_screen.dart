import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:secufy_app/theme/app_theme.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _listAllItems();
  }

  Future<void> _listAllItems() async {
    final storageRef = FirebaseStorage.instance.ref().child("Fotos");
    final listResult = await storageRef.listAll();

    for (var item in listResult.items) {
      String url = await item.getDownloadURL();
      if (mounted) {
        setState(() {
          _items.add(url);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi galería'),
      ),
      backgroundColor: AppTheme.backColor,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Ajusta este valor según el diseño que desees
          crossAxisSpacing: 4.0, // Espacio entre columnas
          mainAxisSpacing: 4.0, // Espacio entre filas
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showImageDialog(context, _items[index]);
            },
            child: GridTile(
              child: Image.network(
                _items[index],
                fit: BoxFit.cover, // Ajusta el tamaño de la imagen
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 248,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
