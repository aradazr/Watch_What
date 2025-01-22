import 'package:flutter/material.dart';
import 'package:random_series/constans/inner_shadow.dart';
import 'package:random_series/constans/responsive_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 1.21,
              child: Text(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'vazirb',
                     fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 20)
                     ),
                '''اگر دنبال سریالی و نمیدونی چه سریالی تماشا کنی٬ جای درستی اومدی چون آرشیو بهترین سریالا اینجا قرار داره و بهت سریالایی معرفی میکنیم که چشم بسته میتونی قبول کنی و شروع به دیدن کنی.''',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InnerShadow(
              blur: 4,
              color: Color.fromARGB(60, 0, 0, 0),
              offset: Offset(0, 4),

              child: Container(
                alignment: Alignment.center,
                height: 57,
                width: 182,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(34),
                  
                  
                ),
                child: Text('!بزن بریم',
                style:TextStyle(
                  color: Colors.white,
                  fontFamily: 'vazirb',
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 17)
                ) ,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
