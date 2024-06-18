import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  List<int> voucherCounts = [2, 2, 2, 2, 2, 2]; // Initial voucher counts

  void _showConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah anda yakin ingin menggunakan voucher ini?'),
          actions: [
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Iya'),
              onPressed: () {
                setState(() {
                  voucherCounts[index]--;
                });
                Navigator.of(context).pop();
                _showSuccessDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selamat'),
          content: Text('Voucher berhasil digunakan!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Langgananku'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.blue.withOpacity(0.2), // Highlighted for voucher
                          ),
                          child: Center(
                            child: Text(
                              'Voucher',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey.withOpacity(0.2), // Faded for subscription
                          ),
                          child: Center(
                            child: Text(
                              'Langganan',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Semua'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Bengkel'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Toko'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Ongkir'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: voucherCounts.length,
                    itemBuilder: (context, index) {
                      if (voucherCounts[index] == 0) return SizedBox.shrink(); // Hide if no vouchers left

                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('images/diskon.png'), // Path to your voucher image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('DISKON 20%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, size: 16),
                                      SizedBox(width: 4),
                                      Text('Berlaku hingga 26 Juli 2023'),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text('Sisa: ${voucherCounts[index]} voucher'),
                                  SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: voucherCounts[index] > 0
                                          ? () => _showConfirmationDialog(context, index)
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        side: BorderSide(color: Colors.blue),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        minimumSize: Size(100, 30), // Adjust the size as needed
                                      ),
                                      child: Text(
                                        'Pakai',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VoucherPage(),
  ));
}
