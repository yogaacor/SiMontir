import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertanyaan',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sampaikan pertanyaanmu disini'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Ketik Pesan',
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Aksi saat tombol ditekan
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}