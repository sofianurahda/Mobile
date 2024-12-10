import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard(
                'https://4.bp.blogspot.com/-o0RH4Y8VKAY/V3s37laxC_I/AAAAAAAABzQ/S1dNtmjCbLYcNB8qNBS_XEdh_XRBTpCcwCLcB/s1600/Gambar-bunga-dahlia-116.JPG'),
            buildImageCard(
                'https://4.bp.blogspot.com/-9Ll-RyAJ9ZQ/V5tm2mwFaLI/AAAAAAAACoo/YI9nEwrL0dMdHR-9RsfttwurKOnnfF4_wCLcB/s1600/Gambar-bunga-4558.JPG'),
            buildImageCard(
                'https://1.bp.blogspot.com/-Rg_-Q_8chro/V5tq6F-ny2I/AAAAAAAACqE/x1i8K50o0hI2P7WxFPWSSG3gfv1ByfuogCLcB/s1600/Gambar-foto-bunga-3377.JPG'),
            buildImageCard(
                'https://4.bp.blogspot.com/-D-XaxtBEDSU/V5tmRWxZW4I/AAAAAAAACoE/MMy5rg7tCqYkJtwTv6-AWpvIi23FZGPPgCLcB/s1600/Gambar-bunga-4556.JPG'),
            buildImageCard(
                'https://4.bp.blogspot.com/-x0iqvrxehTk/V5tomOnYgMI/AAAAAAAACpI/NXJ0Br6k2pU0HVOO2oEDJSPeMDh5AyS0QCLcB/s1600/Gambar-bunga-cantik-1.JPG'),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 150.0,
          width: double.infinity,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(child: const Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}
