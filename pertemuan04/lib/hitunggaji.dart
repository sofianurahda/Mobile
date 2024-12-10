import 'package:flutter/material.dart';

class HitungGaji extends StatefulWidget {
  @override
  _HitungGajiState createState() => _HitungGajiState();
}

class _HitungGajiState extends State<HitungGaji> {
  String golongan = 'Gol I';
  bool isMenikah = false;
  int masaKerja = 0;

  double hasilGaji = 0.0;

  void HitungGaji() {
    double gajiPokok = 0.0;
    double tunjangan = 0.0;
    double bonus = 0.0;

    switch (golongan) {
      case 'Gol I':
        gajiPokok = 2500000;
        break;
      case 'Gol II':
        gajiPokok = 3000000;
        break;
      case 'Gol III':
        gajiPokok = 3500000;
        break;
      case 'Gol Iv':
        gajiPokok = 4000000;
        break;
    }

    // Tunjangan berdasarkan status menikah
    tunjangan = isMenikah ? 1000000 : 500000;

    // Bonus berdasarkan masa kerja
    if (masaKerja >= 5) {
      bonus = 250000;
    } else {
      bonus = 150000;
    }

    //Hitung total gaji
    setState(() {
      hasilGaji = gajiPokok + tunjangan + bonus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Gaji Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Golongan: '),
            DropdownButton<String>(
              value: golongan,
              items:
                  ['Gol I', 'Gol II', 'Gol III', 'Gol IV'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  golongan = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            //Status Menikah
            const Text('Status Menikah: '),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Menikah'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: isMenikah,
                      onChanged: (value) {
                        setState(() {
                          isMenikah = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Belum Menikah'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: isMenikah,
                      onChanged: (value) {
                        setState(() {
                          isMenikah = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            //Input Masa Kerja
            Text('Masa Kerja (tahun): '),
            Slider(
              value: masaKerja.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: masaKerja.toString(),
              onChanged: (value) {
                setState(() {
                  masaKerja = value.toInt();
                });
              },
            ),
            const SizedBox(height: 20),

            //Tombol Hitung
            Center(
              child: ElevatedButton(
                onPressed: HitungGaji,
                child: Text('Hitung Gaji'),
              ),
            ),

            //Hasil Gaji
            const SizedBox(height: 20),
            Text(
              'Hasil Gaji: Rp${hasilGaji.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
