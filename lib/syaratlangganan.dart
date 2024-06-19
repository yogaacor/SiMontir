import 'package:flutter/material.dart';

class SyaratLanggananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syarat dan Ketentuan'),
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
              'Syarat dan Ketentuan Langganan SiMontir',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildNumberedText(
              'Langganan SiMontir merupakan suatu paket yang memberikan subsidi, diskon, voucher, dan / atau jenis promo lainnya sesuai dengan kebijakan dari SiMontir',
              'Masa aktif langganan berlaku hingga waktu yang telah ditentukan',
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
            SizedBox(height: 340),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedText(String line1, String line2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextBlock('1.', line1),
        SizedBox(height: 8),
        _buildTextBlock('2.', line2),
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
