import 'package:flutter/material.dart';
import 'package:flutter_cots/design_system/style/color_collection.dart';
import 'package:flutter_cots/modules/gojek/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  final List<OnboardingSlideData> slides = [
    OnboardingSlideData(
      imagePath: 'lib/modules/gojek/assets/images/slide1.png',
      title: 'Selamat datang di Gojek!',
      description:
          'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.',
    ),
    OnboardingSlideData(
      imagePath: 'lib/modules/gojek/assets/images/slide2.png',
      title: 'Transportasi & Logistik',
      description:
          'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
    ),
    OnboardingSlideData(
      imagePath: 'lib/modules/gojek/assets/images/slide3.png',
      title: 'Pesan Makan & Belanja',
      description: 'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo dan Padding atas
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Image.asset(
              'lib/modules/gojek/assets/images/gojek_logo.png',
              height: 40,
            ),
          ),

          // PageView untuk Slides
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) => controller.pageIndex.value = index,
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return OnboardingSlide(
                  data: slides[index],
                );
              },
            ),
          ),

          // Page Indicator
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    height: 8.0,
                    width: controller.pageIndex.value == index ? 16.0 : 8.0,
                    decoration: BoxDecoration(
                      color: controller.pageIndex.value == index
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              )),
          SizedBox(height: 20),

          // Tombol Aksi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // Tombol Masuk
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),

                // Tombol Daftar
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Belum ada akun?, Daftar dulu',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Ketentuan Layanan
                Text(
                  'Dengan masuk atau mendaftar, kamu menyetujui',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Ketentuan layanan dan Kebijakan privasi',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final OnboardingSlideData data;

  OnboardingSlide({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          data.imagePath,
          height: 200,
        ),
        SizedBox(height: 24),
        Text(
          data.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          data.description,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OnboardingSlideData {
  final String imagePath;
  final String title;
  final String description;

  OnboardingSlideData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
