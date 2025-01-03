import 'package:flutter/material.dart';
import 'package:flutter_cots/modules/gojek/view/order_page.dart';
import 'package:flutter_cots/modules/gojek/view/promo_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    PromoTab(),
    OrderTab(),
    Center(child: Text('Chat Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Promos'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Search Bar & Profile Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Find services, food, or places',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.account_circle, size: 40, color: Colors.grey),
                ],
              ),
              SizedBox(height: 20),

              // GoPay Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rp7,434',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text('Tap for history',
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildGopayOption(Icons.add, 'Top Up'),
                        _buildGopayOption(Icons.payment, 'Pay'),
                        _buildGopayOption(Icons.explore, 'Explore'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Service Options
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildServiceOption(Icons.local_taxi, 'GoRide'),
                  _buildServiceOption(Icons.car_rental, 'GoCar'),
                  _buildServiceOption(Icons.restaurant, 'GoFood'),
                  _buildServiceOption(Icons.local_mall, 'GoMart'),
                  _buildServiceOption(Icons.delivery_dining, 'GoSend'),
                  _buildServiceOption(Icons.payments, 'GoPay'),
                  _buildServiceOption(Icons.health_and_safety, 'GoMed'),
                  _buildServiceOption(Icons.more_horiz, 'More'),
                ],
              ),
              SizedBox(height: 20),

              // Judul Section
              Text(
                'Promo 🤩',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Promo Cards dengan Gambar
              _buildPromoCard(
                imagePath: 'lib/modules/gojek/assets/images/home1.png',
                title: 'Makin Seru 🤩',
                description:
                    'Aktifkan & Sambungkan Gopay & GoPayLater di Tokopedia',
                backgroundColor: Colors.green[100]!,
              ),
              SizedBox(height: 10),
              _buildPromoCard(
                imagePath: 'lib/modules/gojek/assets/images/home2.png',
                title: 'Makin Seru 🤩',
                description: 'Sambungkan akun ke Tokopedia untuk banyak untung',
                backgroundColor: Colors.blue[100]!,
              ),
              SizedBox(height: 10),
              _buildPromoCard(
                imagePath: 'lib/modules/gojek/assets/images/home3.png',
                title: 'Makin Seru 🤩',
                description: 'Bayar apa aja lebih hemat pakai GoPay!',
                backgroundColor: Colors.orange[100]!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Fungsi untuk opsi GoPay
  Widget _buildGopayOption(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white24,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  /// Fungsi untuk opsi Layanan
  Widget _buildServiceOption(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.green),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  /// Fungsi untuk membangun Promo Card dengan Gambar
  Widget _buildPromoCard({
    required String imagePath,
    required String title,
    required String description,
    required Color backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Gambar Promo
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          // Detail Promo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
