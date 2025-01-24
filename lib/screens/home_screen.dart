import 'dart:math'; // برای تولید شماره تصادفی
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:random_series/constans/inner_shadow.dart';
import 'package:random_series/constans/responsive_text.dart';
import 'package:random_series/data/project_manager.dart';
import 'package:random_series/screens/serial_screen.dart';
import 'package:random_series/data/project_data.dart'; // فرض بر این است که اینجا دیتای سریال ها قرار دارد.

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
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
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
                gradient: LinearGradient(colors: [
                  Color.fromARGB(70, 182, 17, 17),
                  Color.fromARGB(70, 80, 8, 8)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
                        speed: Duration(milliseconds: 30),
                        textStyle: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 18),
                          fontFamily: 'vazirb',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        '''اگر دنبال سریالی و نمیدونی چه سریالی تماشا کنی٬ جای درستی اومدی چون آرشیو بهترین سریالا اینجا قرار داره و بهت سریالایی معرفی میکنیم که چشم بسته میتونی قبول کنی و شروع به دیدن کنی.''',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
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
                color: Color.fromARGB(60, 0, 0, 0),
                offset: Offset(0, 4),
                child: Container(
                  alignment: Alignment.center,
                  height: 57,
                  width: 182,
                  decoration: BoxDecoration(
                    color: Color(0xffB61111),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Text(
                    '!بزن بریم',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'vazirb',
                        fontSize: AdaptiveTextSize()
                            .getadaptiveTextSize(context, 17)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
