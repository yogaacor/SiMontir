import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'detailpesan.dart';
import 'promo.dart';
import 'hasiltanggal.dart';

class PesanMontirPage extends StatefulWidget {
  @override
  _PesanMontirPageState createState() => _PesanMontirPageState();
}

class _PesanMontirPageState extends State<PesanMontirPage> {
  String _selectedVehicle = '';
  int _selectedIndex = 0;
  DateTime? _startDate;
  DateTime? _endDate;
  List<DateTime> _weekends = [];

  void _selectVehicle(String vehicle) {
    setState(() {
      _selectedVehicle = vehicle;
    });
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PromoPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<void> _selectDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF56BEE1), // Header background color
            colorScheme: ColorScheme.light(primary: const Color(0xFF56BEE1)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked.start != null && picked.end != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _weekends = _getWeekendsInRange(_startDate!, _endDate!);
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HasilTanggalPage(_startDate!, _endDate!, _weekends)),
      );
    }
  }

  List<DateTime> _getWeekendsInRange(DateTime start, DateTime end) {
    List<DateTime> weekends = [];
    DateTime current = start;
    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      if (current.weekday == DateTime.saturday || current.weekday == DateTime.sunday) {
        weekends.add(current);
      }
      current = current.add(Duration(days: 1));
    }
    return weekends;
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
                height: 320,
                child: CustomPaint(
                  painter: HeaderPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SizedBox(height: 10),
                            Text(
                              'Jangan panik, kita akan segera mengirim \nbantuan, jelaskan apa jenis kendaraan anda?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today, color: Colors.white),
                          onPressed: _selectDateRange,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 98, 173, 211),
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
                      fontSize: 20,
                      letterSpacing: 2.0,
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
              color: isSelected ? Color.fromARGB(255, 133, 165, 193) : Colors.grey[400],
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
