import 'package:flutter/material.dart';

class CaraLanggananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara Penggunaan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28), 
            Text(
              'Cara Penggunaan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildNumberedText(
              'Pilih toko bengkel dan pesan',
              'Pastikan total harga pesanan kamu sesuai minimum order',
              'Total harga kamu akan terpotong sesuai paket langganan kamu secara otomatis',
              'Paket kamu akan diperbarui dan saldo kamu akan otomatis terpotong setelah masa berlaku habis',
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 280), 
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedText(String line1, String line2, String line3, String line4) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextBlock('1.', line1),
        SizedBox(height: 8),
        _buildTextBlock('2.', line2),
        SizedBox(height: 8),
        _buildTextBlock('3.', line3),
        SizedBox(height: 8),
        _buildTextBlock('4.', line4),
      ],
    );
  }

  Widget _buildTextBlock(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
