import 'package:flutter/material.dart';

class Studikasus03 extends StatefulWidget {
  @override
  _Studikasus03State createState() => _Studikasus03State();
}

class _Studikasus03State extends State<Studikasus03> {
  final Map<String, String> bungaImages = {
    'Bunga 1':
        'https://4.bp.blogspot.com/-o0RH4Y8VKAY/V3s37laxC_I/AAAAAAAABzQ/S1dNtmjCbLYcNB8qNBS_XEdh_XRBTpCcwCLcB/s1600/Gambar-bunga-dahlia-116.JPG',
    'Bunga 2':
        'https://4.bp.blogspot.com/-9Ll-RyAJ9ZQ/V5tm2mwFaLI/AAAAAAAACoo/YI9nEwrL0dMdHR-9RsfttwurKOnnfF4_wCLcB/s1600/Gambar-bunga-4558.JPG',
    'Bunga 3':
        'https://1.bp.blogspot.com/-Rg_-Q_8chro/V5tq6F-ny2I/AAAAAAAACqE/x1i8K50o0hI2P7WxFPWSSG3gfv1ByfuogCLcB/s1600/Gambar-foto-bunga-3377.JPG',
    'Bunga 4':
        'https://4.bp.blogspot.com/-D-XaxtBEDSU/V5tmRWxZW4I/AAAAAAAACoE/MMy5rg7tCqYkJtwTv6-AWpvIi23FZGPPgCLcB/s1600/Gambar-bunga-4556.JPG',
    'Bunga 5':
        'https://4.bp.blogspot.com/-x0iqvrxehTk/V5tomOnYgMI/AAAAAAAACpI/NXJ0Br6k2pU0HVOO2oEDJSPeMDh5AyS0QCLcB/s1600/Gambar-bunga-cantik-1.JPG',
  };

  String? selectedBunga;
  String? displayImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studi Kasus 03'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedBunga,
              hint: const Text('Pilih Bunga'),
              isExpanded: true,
              items: bungaImages.keys.map((String key) {
                return DropdownMenuItem<String>(value: key, child: Text(key));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedBunga = newValue;
                  displayImageUrl = null; // Reset saat ganti bunga
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedBunga != null
                  ? () {
                      setState(() {
                        displayImageUrl = bungaImages[selectedBunga];
                      });
                    }
                  : null,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            if (displayImageUrl != null)
              Flexible(
                child: Image.network(
                  displayImageUrl!,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Center(
                child: Text('Belum ada gambar untuk ditampilkan'),
              ),
          ],
        ),
      ),
    );
  }
}
