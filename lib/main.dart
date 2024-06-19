import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilangan Prima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimeNumberForm(),
    );
  }
}

class PrimeNumberForm extends StatefulWidget {
  @override
  _PrimeNumberFormState createState() => _PrimeNumberFormState();
}

class _PrimeNumberFormState extends State<PrimeNumberForm> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  List<int> primes = [];

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void findPrimes(int start, int end) {
    List<int> result = [];
    for (int i = start; i <= end; i++) {
      if (isPrime(i)) {
        result.add(i);
      }
    }
    setState(() {
      primes = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Prima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _startController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Bilangan Awal',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _endController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Bilangan Akhir',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int start = int.parse(_startController.text);
                int end = int.parse(_endController.text);
                findPrimes(start, end);
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            if (primes.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: primes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(primes[index].toString()),
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