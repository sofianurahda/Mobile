import 'package:flutter/material.dart';

class Image03 extends StatelessWidget {
  const Image03({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard('assets/gambar1.jpg', Colors.red),
            buildImageCard('assets/gambar1.jpg', Colors.green),
            buildImageCard('assets/gambar1.jpg', Colors.blue),
            buildImageCard('assets/gambar1.jpg', Colors.yellow),
            buildImageCard('assets/gambar1.jpg', Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(String imagePath, Color color) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          height: 150.0,
          width: double.infinity,
        ),
      ),
    );
  }
}
