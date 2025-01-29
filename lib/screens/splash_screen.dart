import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'dart:async';

import 'home_screen.dart'; // صفحه HomeScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isMobile = true; // وضعیت پیش‌فرض دستگاه (موبایل)

  @override
  void initState() {
    super.initState();
    _checkInternetAndDevice();
  }

  Future<void> _checkInternetAndDevice() async {
    // بررسی اتصال اینترنت
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'اتصال به اینترنت برقرار نیست!',
            style: TextStyle(fontFamily: 'vazir', fontSize: 14),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      // اگر اینترنت مشکلی ندارد، منتظر بماند و سپس به صفحه اصلی برود
      await Future.delayed(const Duration(seconds: 2));
      if (_isMobile) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // بررسی نوع دستگاه با MediaQuery
    _isMobile = size.width < 600; // عرض زیر 600 به‌عنوان موبایل

    // نمایش پیام برای دستگاه‌های غیربزرگ (تبلت/دسکتاپ)
    if (!_isMobile) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: DarkColors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              '.این برنامه فقط برای دستگاه‌های موبایل طراحی شده است',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'vazirm',
                fontSize: 18,
                color: DarkColors.white,
              ),
            ),
          ),
        ),
      );
    }

    // صفحه اسپلاش برای موبایل
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/watchwhat.png',
              height: size.height / 4.83,
            ),
            SizedBox(
              height: size.height / 30.5,
            ),
            const SpinKitSpinningLines(
              color: DarkColors.white,
              size: 89.0,
            ),
          ],
        ),
      ),
    );
  }
}