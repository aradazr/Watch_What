import 'dart:math'; // برای تولید شماره تصادفی
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/provider/favorite_series_provider.dart';
import 'package:watch_what/constans/responsive_text.dart';
import 'package:watch_what/provider/watched_series_provider.dart';
import 'package:watch_what/data/project_data.dart';
import 'package:watch_what/data/project_manager.dart';
import 'package:watch_what/screens/watched_and_liked_screen.dart';
import 'package:watch_what/widgets/bttn_widget.dart';
import 'package:watch_what/widgets/upper_button.dart';

class SerialScreen extends StatefulWidget {
  final Series serial;

  const SerialScreen({super.key, required this.serial});

  @override
  State<SerialScreen> createState() => _SerialScreenState();
}

class _SerialScreenState extends State<SerialScreen> {
  late Series currentSerial;
  bool isSelected1 = false;
  bool isSelected2 = false;

  @override
  void initState() {
    super.initState();
    currentSerial = widget.serial; // مقداردهی اولیه

    List<Series> availableSeries = projects
        .where((project) =>
            !context.read<WatchedSeriesProvider>().isWatched(project))
        .toList();

    if (availableSeries.isEmpty) {
      currentSerial = Series(
        name: "تمامی سریال ها تماشا شده اند",
        description: "All series have been watched",
        imagePath:
            "https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/03/high-rated-tv-shows-and-their-lowest-rated-episodes.jpg",
        serialUrl: "https://google.com",
        point: '0',
      );
    } else {
      currentSerial = availableSeries.first;
    }

    setState(() {}); // 🔹 فقط یک بار setState()
  }

// تابع انتخاب سریال تصادفی
  void getRandomSerial() {
    setState(() {
      List<Series> availableSeries = projects
          .where((project) =>
              !context.read<WatchedSeriesProvider>().isWatched(project))
          .toList();

      if (availableSeries.isNotEmpty) {
        currentSerial =
            availableSeries[Random().nextInt(availableSeries.length)];
      } else {
        currentSerial = Series(
          name: "تمامی سریال ها تماشا شده اند",
          description: "All series have been watched",
          imagePath:
              "https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/03/high-rated-tv-shows-and-their-lowest-rated-episodes.jpg",
          serialUrl: "https://google.com",
          point: '0',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: DarkColors.black,
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
                  child: CachedNetworkImage(
                    imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                    errorWidget: (context, url, error) {
                      return SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'اینترنت شما قطع میباشد',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'vazirb',
                              fontSize: const AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 14),
                            ),
                          ));
                    },
                    placeholder: (context, url) => const SpinKitSpinningLines(
                      color: Colors.white,
                      size: 89.0,
                    ),
                    imageUrl: currentSerial.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: size.width / 1,
                  height: 20,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: DarkColors.black,
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
                          color: DarkColors.white,
                          fontFamily: 'mont',
                          fontSize: const AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                        ),
                      ),
                      Image.asset('assets/images/star.png', height: 24),
                    ],
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UpperButton(
                          size: size,
                          image: 'assets/images/back.png',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        if (currentSerial.name !=
                            "تمامی سریال ها تماشا شده اند")
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              UpperButton(
                                size: size,
                                image: context
                                        .watch<WatchedSeriesProvider>()
                                        .isWatched(currentSerial)
                                    ? 'assets/images/watchedred.png'
                                    : 'assets/images/watched.png',
                                onTap: () {
                                  context
                                      .read<WatchedSeriesProvider>()
                                      .toggleWatched(currentSerial);
                                },
                              ),
                              SizedBox(
                                width: size.width / 45,
                              ),
                              UpperButton(
                                size: size,
                                image: context
                                        .watch<FavoriteSeriesProvider>()
                                        .isLiked(currentSerial)
                                    ? 'assets/images/likered.png'
                                    : 'assets/images/like.png',
                                onTap: () {
                                  context
                                      .read<FavoriteSeriesProvider>()
                                      .toggleLike(currentSerial);
                                },
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: DarkColors.black,
              ),
              child: Column(
                children: [
                  Text(
                    currentSerial.name,
                    style: TextStyle(
                      fontFamily: 'mont',
                      fontSize: const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 24),
                      color: DarkColors.white,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 45,
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
                          fontSize: const AdaptiveTextSize()
                              .getadaptiveTextSize(context, 13),
                          color: DarkColors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BttnWidget(
                        size: size,
                        color: DarkColors.greyButton,
                        text: 'سریال های من',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WatchedAndLikedScreen()));
                        },
                      ),
                      BttnWidget(
                        size: size,
                        color: DarkColors.redButton,
                        text: '!دوباره سرچ کن',
                        onTap: getRandomSerial,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse(
                          'https://www.instagram.com/aradazr.dev/profilecard/?igsh=dGhtMm92MXFna2Qx');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ساخته شده توسط آراد آذرپناه',
                          style: TextStyle(
                            color: DarkColors.grey,
                            fontFamily: 'vazirb',
                            fontSize: const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 10),
                          ),
                        ),
                        SizedBox(
                          width: size.width / 90,
                        ),
                        const Icon(Icons.link, color: DarkColors.grey),
                      ],
                    ),
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
