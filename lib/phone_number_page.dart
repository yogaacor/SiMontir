import 'package:flutter/material.dart';
import 'package:simontir/persona_info_page.dart';
// Import halaman baru

class PhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masukkan Nomor HP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Masukkan Nomor Hp',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Silakan masukkan nomor HP yang valid untuk melanjutkan proses registrasi.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nomor HP',
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke PersonalInfoPage saat tombol 'Lanjut' ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalInfoPage()),
                  );
                },
                child: Text(
                  'Lanjut',
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, // Warna tombol biru muda
                  padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
