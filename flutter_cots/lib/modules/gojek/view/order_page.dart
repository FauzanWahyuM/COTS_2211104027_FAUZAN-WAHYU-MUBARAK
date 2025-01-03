import 'package:flutter/material.dart';

class OrderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Pesanan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Filter Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFilterTab('Riwayat', true),
                  _buildFilterTab('Dalam proses', false),
                  _buildFilterTab('Terjadwal', false),
                ],
              ),
              SizedBox(height: 20),

              // Dropdown & GoPay Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDropdownFilter('GoFood'),
                  _buildDropdownFilter('Status'),
                ],
              ),
              SizedBox(height: 10),

              // GoPay Transaction Button
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.blue),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text('Transaksi GoPay',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Order List Section
              _buildOrderItem(
                title: 'Ayam Benjoss, kedungkandang',
                price: 'Rp.58.800',
                itemCount: '3 item',
                description: '2 Paket Ayam Bakar Jumbo',
                dateTime: '28 Des 11.36',
              ),
              SizedBox(height: 10),

              _buildOrderItem(
                title: 'Ayam Benjoss, kedungkandang',
                price: 'Rp.58.800',
                itemCount: '3 item',
                description: '2 Paket Ayam Bakar Jumbo',
                dateTime: '28 Des 11.36',
              ),
              SizedBox(height: 10),

              _buildOrderItem(
                title: 'Ayam Benjoss, kedungkandang',
                price: 'Rp.58.800',
                itemCount: '3 item',
                description: '2 Paket Ayam Bakar Jumbo',
                dateTime: '28 Des 11.36',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTab(String label, bool isSelected) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDropdownFilter(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.black)),
          Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String title,
    required String price,
    required String itemCount,
    required String description,
    required String dateTime,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(price, style: TextStyle(color: Colors.black)),
            ],
          ),
          SizedBox(height: 5),
          Text('$itemCount \u2022 $description',
              style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          Text('Makanan sudah diantar $dateTime',
              style: TextStyle(color: Colors.green)),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Pesan lagi',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
