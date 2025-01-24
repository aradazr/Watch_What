import 'dart:math'; // برای تولید شماره تصادفی
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:random_series/data/project_data.dart';
import 'package:random_series/constans/responsive_text.dart';
import 'package:random_series/data/project_manager.dart';
import 'package:random_series/screens/my_profile_screen.dart';
import 'package:random_series/widgets/bttn_widget.dart';

class SerialScreen extends StatefulWidget {
  final Series serial;

  const SerialScreen({super.key, required this.serial});

  @override
  State<SerialScreen> createState() => _SerialScreenState();
}

class _SerialScreenState extends State<SerialScreen> {
  late Series currentSerial;

  @override
  void initState() {
    super.initState();
    currentSerial = widget.serial; // مقداردهی اولیه
  }

  // تابع انتخاب سریال تصادفی
  void getRandomSerial() {
    setState(() {
      currentSerial = projects[Random().nextInt(projects.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Stack(
              key: ValueKey<String>(currentSerial.name),
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: size.height / 1.63,
                  width: size.width,
                  child: 
                  // CachedImage(
                  //   imageUrl: currentSerial.imagePath,
                  //   radius: 0,
                  //   fit: BoxFit.cover,
                  // )
                 CachedNetworkImage(
                  imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                  errorWidget: (context, url, error) => SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text('اینترنت شما قطع میباشد',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'vazirb',
                    fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14),
                  ),
                  )),
                  placeholder: (context, url) =>  Image.asset('assets/images/background.png'),
                  imageUrl: 
                    currentSerial.imagePath,
                    
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: size.width/1,
                  height: 20,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 40,
                        blurRadius: 45,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentSerial.point,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'mont',
                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14),
                        ),
                      ),
                      Image.asset('assets/images/star.png', height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Text(
                    currentSerial.name,
                    style: TextStyle(
                      fontFamily: 'mont',
                      fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 24),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 32.37,
                  ),
                  SizedBox(
                    height: size.height / 6.33,
                    width: size.width / 1.18,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        currentSerial.description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'vazirm',
                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 13),
                          color: const Color(0xff999999),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 57,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BttnWidget(
                        size: size,
                        color: Color(0xff262626),
                        text: 'همینو میبینم',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                        },
                      ),
                      BttnWidget(
                        size: size,
                        color: Color(0xffB61111),
                        text: '!دوباره سرچ کن',
                        onTap: getRandomSerial,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}