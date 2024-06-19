import 'package:flutter/material.dart';
import 'voucher.dart';
import 'pesanmontir.dart'; 

class PromoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Promo',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.card_giftcard),
                    ],
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VoucherPage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 120),
                          Container(
                            padding: EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text('6', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('Vouchers'),
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text('0', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text('Langganan'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan kode promo',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Promo terbaru buat kamu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 200, 
                    child: PageView.builder(
                      itemCount: 6, 
                      controller: PageController(viewportFraction: 0.9),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.blue, 
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'Promo Banner ${index + 1}',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Toko dengan promo besar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 6, 
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              color: Colors.grey, 
                              child: Center(child: Text('Promo Image', style: TextStyle(color: Colors.white))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text('40% off', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(height: 4),
                                  Text('Service Motor'),
                                  SizedBox(height: 4),
                                  Text('Bengkel 123, Patemon, Gunung Pati'),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow, size: 16),
                                      SizedBox(width: 4),
                                      Text('4.3'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
            selectedItemColor: Color(0xFF56BEE1),
            unselectedItemColor: Colors.grey,
            currentIndex: 1, 
            onTap: (index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PesanMontirPage()), 
                );
              }
              
            },
          ),
        ),
      ),
    );
  }
}
