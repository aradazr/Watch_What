import 'dart:math'; // برای تولید شماره تصادفی
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/constans/inner_shadow.dart';
import 'package:watch_what/constans/responsive_text.dart';
import 'package:watch_what/data/project_manager.dart';
import 'package:watch_what/screens/serial_screen.dart';
import 'package:watch_what/screens/watched_and_liked_screen.dart';

import '../data/project_data.dart';

// فرض بر این است که اینجا دیتای سریال ها قرار دارد.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // انتخاب تصادفی یک سریال از لیست
  Series pickRandomSeries() {
    return projects[Random().nextInt(projects.length)];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: DarkColors.black,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width / 1.23,
              height: size.height / 2.68,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: DarkColors.primeryContainer,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(39),
              ),
              child: SizedBox(
                width: size.width / 1.596,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        cursor: '',
                        speed: const Duration(milliseconds: 30),
                        textStyle: TextStyle(
                            fontSize: const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 18),
                            fontFamily: 'vazirb',
                            color: DarkColors.white),
                        textAlign: TextAlign.center,
                        '''اگر دنبال سریالی و نمیدونی چه سریالی تماشا کنی٬ جای درستی اومدی چون آرشیو بهترین سریالا اینجا قرار داره و بهت سریالایی معرفی میکنیم که چشم بسته میتونی قبول کنی و شروع به دیدن کنی.''',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                // ارسال سریال تصادفی به SerialScreen
                Series randomSeries = pickRandomSeries();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SerialScreen(serial: randomSeries),
                  ),
                );
              },
              child: InnerShadow(
                blur: 4,
                color: DarkColors.buttonInnerShadow,
                offset: const Offset(0, 4),
                child: Container(
                  alignment: Alignment.center,
                  height: 57,
                  width: 182,
                  decoration: BoxDecoration(
                    color: DarkColors.redButton,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Text(
                    '!بزن بریم',
                    style: TextStyle(
                        color: DarkColors.white,
                        fontFamily: 'vazirb',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 17)),
                  ),
                ),
              ),
            )
                .animate(
                  autoPlay: true,
                )
                .shake(delay: const Duration(seconds: 1)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WatchedAndLikedScreen()));
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.amber,
                  ),
                )
          ],
        ),
      ),
    );
  }
}
