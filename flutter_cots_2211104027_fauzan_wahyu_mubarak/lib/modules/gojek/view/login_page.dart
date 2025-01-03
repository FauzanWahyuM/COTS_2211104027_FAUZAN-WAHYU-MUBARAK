import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  // Declare the phone controller
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // Logo Gojek dan Tombol Kembali
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke layar sebelumnya
                    },
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    'lib/modules/gojek/assets/images/gojek_logo.png',
                    height: 30,
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Judul dan Subjudul
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Enter your registered phone number to log in",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Input Nomor Telepon
              Text(
                "Phone number*",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  // Kode Negara
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        Image.asset(
                          'lib/modules/gojek/assets/images/Flags.png', // Path ikon bendera Indonesia
                          height: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "+62",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  // Input Nomor Telepon
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                                10.0), // Menyesuaikan jarak input dengan garis bawah
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: Colors.black54),
                          onPressed: () {
                            phoneController.clear();
                          },
                        ),
                        hintText: "Masukkan No Telepon",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman masalah nomor
                },
                child: Text(
                  "Issue with number?",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              // Tombol Lanjutkan
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk melanjutkan login
                  Get.toNamed('/main'); // Navigasi ke halaman main
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
