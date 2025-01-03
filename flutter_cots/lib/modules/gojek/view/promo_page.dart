import 'package:flutter/material.dart';

class PromoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // XP Progress Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.stars, color: Colors.orange, size: 40),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('121 XP to your next treasure',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: 0.6,
                            color: Colors.orange,
                            backgroundColor: Colors.orange[200],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Promo Metrics Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPromoMetric('13', 'Vouchers', 'Akan hangus'),
                  _buildPromoMetric('0', 'Langganan', 'Lagi aktif'),
                  _buildPromoMetric('0', 'Mission', 'Lagi berjalan'),
                ],
              ),
              SizedBox(height: 20),

              // Input Kode Promo
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan kode promo',
                  prefixIcon: Icon(Icons.local_offer, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),

              // Filter Promo
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPromoFilterChip('Apa aja', true),
                    _buildPromoFilterChip('GoFood', false),
                    _buildPromoFilterChip('GoPay', false),
                    _buildPromoFilterChip('GoPayLater', false),
                    _buildPromoFilterChip('GoRide', false),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Promo Card Section
              Text(
                'Biar makin hemat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              _buildPromoCard(
                title: 'Promo menarik dari brand populer',
                description: 'Buat rileks atau produktif, kamu yang tentuin!',
                image: Icons.fastfood,
                backgroundColor: Colors.red[100]!,
              ),
              SizedBox(height: 10),

              _buildPromoCard(
                title: 'Promo cashback menarik',
                description: 'Dapatkan cashback spesial dengan GoPay!',
                image: Icons.monetization_on,
                backgroundColor: Colors.blue[100]!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoMetric(String value, String title, String subtitle) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
        Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.orange)),
      ],
    );
  }

  Widget _buildPromoFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.green,
        backgroundColor: Colors.grey[200],
        labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black, fontSize: 14),
        onSelected: (value) {},
      ),
    );
  }

  Widget _buildPromoCard({
    required String title,
    required String description,
    required IconData image,
    required Color backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(image, color: Colors.green),
        ),
        title: Text(title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(description,
            style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ),
    );
  }
}
