import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watch_what/constans/responsive_text.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
          ),
          
          Container(
            height: size.height / 1.31,
            width: size.width / 1.2,
            decoration: BoxDecoration(
              color: const Color(0xff202020),
              borderRadius: BorderRadius.circular(38),
            ),
            child: Column(
              
              children: [
                Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('assets/images/back.png')),
              )
            ],
          ),
          SizedBox(
            height: size.height/45,
          ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/images/arad.png',
                      height: size.height / 3.75,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height / 20.32,
                      width: size.width / 3.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'ARADAZR.DEV',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: const AdaptiveTextSize()
                              .getadaptiveTextSize(context, 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 32.37,
                ),
                SizedBox(
                  height: size.height / 3.52,
                  width: size.width / 1.477,
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
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                            '''سلام دوستان من آراد آذرپناه برنامه نویس موبایل و وب هستم.بیشتر از یک ساله که در این حوزه ها فعالیت دارم و نمونه کارهامم در  سایتم موجوده.اگر از این اپ لذت بردید میتونید با فالو کردن من در اینستا ازم حمایت کنید.'''),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 36.41,
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://www.instagram.com/aradazr.dev/profilecard/?igsh=dGhtMm92MXFna2Qx');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: Image.asset(
                    'assets/images/instagram.png',
                    height: 37,
                  )),
              Image.asset(
                'assets/images/divider.png',
                height: 37,
              ),
              GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse('https://github.com/aradazr');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: Image.asset(
                    'assets/images/git.png',
                    height: 37,
                  )),
              Image.asset(
                'assets/images/divider.png',
                height: 37,
              ),
              GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://x.com/aradowskii?s=21&t=SqK2zuya-WrOPla0cTBtgw');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: Image.asset(
                    'assets/images/twitter.png',
                    height: 37,
                  )),
              Image.asset(
                'assets/images/divider.png',
                height: 37,
              ),
              GestureDetector(
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://www.linkedin.com/in/aradazr/');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch');
                    }
                  },
                  child: Image.asset(
                    'assets/images/linkdin.png',
                    height: 37,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
