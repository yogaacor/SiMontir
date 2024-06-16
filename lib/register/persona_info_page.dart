import 'package:flutter/material.dart';
import '../login/login_page.dart'; // Import halaman login

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey =
      GlobalKey<FormState>(); // Buat global key untuk validasi form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Gunakan global key di sini
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Masukkan Nama dan Data Diri',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Silakan masukkan nama dan alamat lengkap Anda.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Validasi formulir sebelum melanjutkan
                    if (_formKey.currentState!.validate()) {
                      String name = nameController.text.trim();
                      String address = addressController.text.trim();

                      if (_isValidName(name) && _isValidAddress(address)) {
                        // Navigasi ke LoginPage jika valid
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    }
                  },
                  child: Text(
                    'Lanjut',
                    style: TextStyle(color: Colors.white), // Warna teks putih
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue, // Warna tombol biru muda
                    padding:
                        EdgeInsets.symmetric(horizontal: 135, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidName(String name) {
    return name.isNotEmpty;
  }

  bool _isValidAddress(String address) {
    return address.isNotEmpty;
  }
}
