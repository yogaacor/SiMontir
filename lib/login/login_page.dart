import 'package:flutter/material.dart';
import 'package:simontir/register/email_password_login_page.dart';
import 'input_data.dart'; // Import halaman InputDataPage

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              SizedBox(height: 50),
              Image(image: AssetImage('images/Logo Simontir.png')),
              // Selamat Datang
              SizedBox(
                height: 30,
              ),
              Text(
                'Selamat datang di SiMontir!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Aplikasi yang membuat kondisi gentingmu lebih mudah teratasi, kapapun, dan dimanapun',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height:
                      30), // Tambahkan SizedBox dengan ketinggian sesuai keinginan
              // Tombol Masuk
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman InputDataPage saat tombol 'Masuk' ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputDataPage()),
                  );
                },
                child: Text(
                  'Masuk',
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, // Warna tombol biru muda
                  padding: EdgeInsets.symmetric(horizontal: 135, vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              // Tombol Register
              OutlinedButton(
                onPressed: () {
                  // Navigasi ke EmailPasswordLoginPage saat tombol "Daftar dulu" ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmailPasswordLoginPage()),
                  );
                },
                child: Text(
                  'Belum ada akun? Daftar dulu',
                  style: TextStyle(
                      color: Colors.lightBlue), // Warna teks biru muda
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: Colors.lightBlue,
                      width: 2), // Garis tepi biru muda
                  padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              // Teks kecil di bawah tombol Register
              Text(
                'Dengan masuk atau mendaftar, kamu menyetujui',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                'Ketentuan layanan dan Kebijakan privasi.',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
