import 'package:flutter/material.dart';

class Combobox02 extends StatefulWidget {
  const Combobox02({super.key});
  @override
  _Combobox02State createState() => _Combobox02State();
}

class _Combobox02State extends State<Combobox02> {
  String? pilihKategori;
  String? pilihItem;

  final List<String> categories = ['Buah', 'Sayur'];

  final Map<String, List<String>> items = {
    'Buah': ['Apel', 'Pisang', 'Jeruk'],
    'Sayur': ['Wortel', 'Bayam', 'Kangkung']
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combobox Bersarang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: pilihKategori,
              hint: const Text('Pilih Kategori'),
              onChanged: (String? newValue) {
                setState(() {
                  pilihKategori = newValue;
                  pilihItem = null;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: pilihItem,
              hint: Text('Pilih Item'),
              onChanged: (String? newValue) {
                setState(() {
                  pilihItem = newValue;
                });
              },
              items: pilihKategori != null
                  ? items[pilihKategori!]!
                      .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }
}
