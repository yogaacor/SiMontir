import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HasilTanggalPage extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final List<DateTime> weekends;

  HasilTanggalPage(this.startDate, this.endDate, this.weekends);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Tanggal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hari Sabtu dan Minggu antara ${DateFormat('dd MMM yyyy').format(startDate)} dan ${DateFormat('dd MMM yyyy').format(endDate)}:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: weekends.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      DateFormat('EEEE, dd MMM yyyy').format(weekends[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
