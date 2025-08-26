import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  final String saldo = "Rp. 1.000.000";

  final TextEditingController rekeningController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController ketController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              "Saldo Anda : $saldo",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 20),

            TextField(
              controller: rekeningController,
              decoration: InputDecoration(
                hintText: "Masukkan no.rekening tujuan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: "Masukkan nama penerima",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: nominalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Masukkan nominal",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: ketController,
              decoration: InputDecoration(
                hintText: "Keterangan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Batal"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 20)),
                  onPressed: () {
                    // Aksi saat klik selesai
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Transfer Berhasil!")),
                    );
                  },
                  child: Text("Selesai"),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              color: Colors.teal[700],
              child: Center(
                child: Text(
                  "CopyRight | Kelompok Transaku",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
