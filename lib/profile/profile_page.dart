import 'package:flutter/material.dart';
import 'package:simontir/profile/edit_profile_page.dart';
import 'order_history_page.dart'; // Make sure to import the OrderHistoryPage

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _quickLoginEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.withOpacity(0.6), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildProfileMenu(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: Icon(Icons.person, size: 50, color: Colors.blue),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cahyo Kopling',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.black, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '0812 3456 7890',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.black, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'CahyoKopling@gmail.com',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Container(
            width: 30, // Ubah ukuran lebar lingkaran
            height: 30, // Ubah ukuran tinggi lingkaran
            decoration: BoxDecoration(
              color: Color.fromARGB(
                  255, 129, 198, 255), // Pastikan warna lingkaran biru
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.edit, color: Colors.white),
              iconSize: 16, // Perkecil ukuran ikon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Akun',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ProfileMenuItem(
          icon: Icons.shopping_cart,
          text: 'Pesanan',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderHistoryPage()),
            );
          },
        ),
        ProfileMenuItem(
          icon: Icons.local_offer,
          text: 'Promo',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.payment,
          text: 'Metode Pembayaran',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.group_add,
          text: 'Ajak Teman',
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.login, color: Colors.black),
          title: Text(
            'Quick Login',
            style: TextStyle(color: Colors.black),
          ),
          trailing: Switch(
            value: _quickLoginEnabled,
            onChanged: (bool value) {
              setState(() {
                _quickLoginEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
          hoverColor: Colors.white,
        ),
        ProfileMenuItem(
          icon: Icons.store,
          text: 'Toko Saya',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.build,
          text: 'Bengkel Saya',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.security,
          text: 'Keamanan Akun',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.settings,
          text: 'Atur Akun',
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => EditProfilePage()),
            // );
          },
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 10,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promo'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Toko'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
      currentIndex: 3,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {},
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ProfileMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(text, style: TextStyle(color: Colors.black)),
      trailing: Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap,
    );
  }
}
