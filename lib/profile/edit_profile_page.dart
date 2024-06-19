import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import the ProfilePage

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            _buildEditProfilePhoto(),
            SizedBox(height: 20),
            _buildEditProfileForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditProfilePhoto() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
                'assets/default_avatar.png'), // Replace with actual profile image
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.white),
              onPressed: () {
                // Implement image capture from camera
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditProfileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: 'Cahyo Kopling', // Replace with actual value
          decoration: InputDecoration(
            labelText: 'Nama',
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          initialValue: '0812 3456 7890', // Replace with actual value
          decoration: InputDecoration(
            labelText: 'Nomor HP',
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          initialValue: 'CahyoKopling@gmail.com', // Replace with actual value
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 60),
        Center(
          // Center the button
          child: ElevatedButton(
            onPressed: () {
              // Navigate to ProfilePage when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Text(
              'Simpan',
              style: TextStyle(color: Colors.white), // White text
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Blue background
              padding: EdgeInsets.symmetric(horizontal: 135, vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}
