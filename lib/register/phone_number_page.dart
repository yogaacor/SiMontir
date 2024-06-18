import 'package:flutter/material.dart';
import 'package:simontir/register/persona_info_page.dart';
//import 'package:simontir/personal_info_page.dart'; // Import halaman baru

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Masukkan Nomor HP',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                'Silakan masukkan nomor HP yang valid untuk melanjutkan proses registrasi.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Nomor HP',
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor HP tidak boleh kosong';
                  } else if (!_isValidPhoneNumber(value)) {
                    return 'Nomor HP tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInfoPage()),
                      );
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

  bool _isValidPhoneNumber(String phoneNumber) {
    // Regular expression to match phone numbers with length between 5 and 20
    return RegExp(r'^\+?\d{5,20}$').hasMatch(phoneNumber);
  }
}
