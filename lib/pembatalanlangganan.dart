import 'package:flutter/material.dart';

class PembatalanLanggananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aturan Pembatalan'),
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
              'Aturan Pembatalan Langganan SiMontir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildNumberedText(
              'Setelah membatalkan langganan, anda tidak dapat menggunakan subsidi, diskon, voucher, dan / atau jenis promo yang berlaku',
              'Subsidi, diskon, voucher, dan / atau jenis promo yang masih berlaku akan hangus',
              'Anda dapat kembali berlangganan dengan melakukan transaksi pada fitur Langganan SiMontir',
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

  Widget _buildNumberedText(String line1, String line2, String line3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextBlock('1.', line1),
        SizedBox(height: 8),
        _buildTextBlock('2.', line2),
        SizedBox(height: 8),
        _buildTextBlock('3.', line3),
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
