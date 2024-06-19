import 'package:flutter/material.dart';

class PembayaranLanggananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih metode pembayaran'),
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
          children: [
            ListTile(
              leading: Image.asset('images/linkaja.png', width: 40, height: 40), // Adjust the path as needed
              title: Text('LinkAja'),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF56BEE1),
                ),
                child: Text('Gunakan'),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.credit_card, size: 40, color: Colors.grey[700]),
              title: Text('Kartu Kredit atau debit'),
              subtitle: Text('Visa, MasterCard, AMEX, dan JCB'),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF56BEE1),
                ),
                child: Text('Tambah'),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.credit_card, size: 40, color: Colors.grey[700]),
              title: Text('Kartu Kredit atau debit'),
              subtitle: Text('Visa, MasterCard, AMEX, dan JCB'),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF56BEE1),
                ),
                child: Text('Tambah'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
