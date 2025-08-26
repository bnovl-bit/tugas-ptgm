import 'package:flutter/material.dart';

void main() => runApp(TransakuApp());

class TransakuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaku',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// Footer widget agar bisa dipakai ulang
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[700],
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Text(
          '© Kelompok Transaku',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String name = "Bachtiar Noval Aditya";
  final String noRek = "987654321";
  final String saldo = "Rp. 1.000.000,00";

  final List<Map<String, dynamic>> menu = [
    {'label': 'Transfer', 'icon': Icons.send},
    {'label': 'Top Up', 'icon': Icons.account_balance_wallet},
    {'label': 'Pulsa / Data', 'icon': Icons.phone_android},
    {'label': 'Setting', 'icon': Icons.settings},
    {'label': 'Informasi', 'icon': Icons.info},
    {'label': 'Lainnya', 'icon': Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: Colors.teal[700],
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TRANSAKU',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 15,
                  child: Icon(Icons.person, size: 18, color: Colors.black54),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.lightBlue[100],
              borderRadius: BorderRadius.circular(12),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Halo, $name",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 4),
                Text("No. Rek : $noRek",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87)),
                SizedBox(height: 8),
                Text("Saldo Aktif"),
                Text(saldo,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: menu.map((item) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      if (item['label'] == 'Transfer') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TransferPage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item['icon'], size: 30, color: Colors.black54),
                          SizedBox(height: 6),
                          Text(item['label'],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Saldo Anda : $saldo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Input Form
                TextField(
                  controller: rekeningController,
                  decoration: InputDecoration(
                    labelText: "No. Rekening Tujuan",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),

                TextField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: "Nama Penerima",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),

                TextField(
                  controller: nominalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Nominal",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),

                TextField(
                  controller: ketController,
                  decoration: InputDecoration(
                    labelText: "Keterangan",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Tombol Aksi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Batal"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        if (rekeningController.text.isEmpty ||
                            namaController.text.isEmpty ||
                            nominalController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Mohon lengkapi semua data transfer!")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Transfer Berhasil!")),
                          );
                        }
                      },
                      child: Text("Selesai"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Footer(),
        ],
      ),
    );
  }
}
