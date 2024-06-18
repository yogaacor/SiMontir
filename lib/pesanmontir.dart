import 'package:flutter/material.dart';
import 'detailpesan.dart';
import 'promo.dart'; // Tambahkan impor untuk halaman promo

class PesanMontirPage extends StatefulWidget {
  @override
  _PesanMontirPageState createState() => _PesanMontirPageState();
}

class _PesanMontirPageState extends State<PesanMontirPage> {
  String _selectedVehicle = '';
  int _selectedIndex = 0; // Set default selected index to 0 (Beranda)

  void _selectVehicle(String vehicle) {
    setState(() {
      _selectedVehicle = vehicle;
    });
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PromoPage()), // Pindah ke halaman promo
      );
    } else {
      setState(() {
        _selectedIndex = index;
        // Anda bisa menambahkan logika navigasi untuk halaman lain di sini
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 320, // Height of the blue header
                child: CustomPaint(
                  painter: HeaderPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hai! Selamat Datang \nDwi Puta',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10), // Add space between the two lines of text
                            Text(
                              'Jangan panik, kita akan segera mengirim \nbantuan, jelaskan apa jenis kendaraan anda?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Add space between header and images
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildVehicleBackground('images/motor.png', 'Motor'),
                    _buildVehicleBackground('images/mobil.png', 'Mobil'),
                  ],
                ),
              ),
              SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 98, 173, 211), // slightly darker blue
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPesanPage()),
                    );
                  },
                  child: Text(
                    'Lanjut',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Increase font size
                      letterSpacing: 2.0, // Add letter spacing
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 35,
            left: 8,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                // Handle back button press
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: 'Promo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'Toko',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFF56BEE1),
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleBackground(String imagePath, String text) {
    bool isSelected = _selectedVehicle == text;
    return GestureDetector(
      onTap: () => _selectVehicle(text),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isSelected ? Color.fromARGB(255, 133, 165, 193) : Colors.grey[400], // Highlight selected vehicle
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF56BEE1)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 1.005,
      size.width,
      size.height * 0.65,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);

    // Add shadow
    final shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawShadow(path, Colors.grey, 3.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
