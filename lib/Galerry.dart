import 'package:flutter/material.dart';

class Galeri extends StatelessWidget {
  final List<String> foto = [
    'assets/ariana1.jpg',
    'assets/ariana2.jpg',
    'assets/ariana3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: foto.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: ClipRRect(
                  child: Image.asset(
                foto[index],
                width: 350,
                height: 200,
                fit: BoxFit.cover,
              )),
            ),
          );
        },
      ),
    );
  }
}
