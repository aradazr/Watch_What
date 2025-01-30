import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/provider/favorite_series_provider.dart';
import 'package:watch_what/widgets/liked_serial_container.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final likedSeries = context.watch<FavoriteSeriesProvider>().likedSeries;

    return Scaffold(
      backgroundColor: DarkColors.black,
      body: likedSeries.isEmpty
          ? const Center(
              child: Text(
                'هیچ سریالی لایک نشده',
                style: TextStyle(color: Colors.white, fontFamily: 'vazirb'),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: ListView.builder(
                itemCount: likedSeries.length,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: IntrinsicHeight(
                            child: Container(
                              width: size.width / 1.1,
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: size.width / 1.1,
                                child: Slidable(
                                  direction: Axis.horizontal,

                                  closeOnScroll: true,
                                  key: ValueKey(likedSeries[index]
                                      .name), // مشخص کردن کلید منحصر به فرد
                                  startActionPane: ActionPane(
                                    motion:
                                        const StretchMotion(), // امکان کشیدن به چپ
                                    children: [
                                      SlidableAction(
                                        autoClose: true,
                                        onPressed: (_) {
                                          context
                                              .read<FavoriteSeriesProvider>()
                                              .removeLike(likedSeries[index]);
                                        },
                                        backgroundColor: Colors.red,
                                        icon: Icons.delete,
                                        label: 'حذف',
                                      ),
                                    ],
                                  ),
                                  child: LikedSerialContainer(
                                    size: size,
                                    series: likedSeries[
                                        index], // پاس دادن سریال‌های لایک‌شده
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .animate()
                      .slideX(
                        begin: 1, // شروع از سمت راست
                        end: 0, // پایان در موقعیت عادی
                        duration:
                            300.ms + (index * 100).ms, // تأخیر برای هر آیتم
                        curve: Curves.easeOut,
                      )
                      .fade(duration: 300.ms, delay: (index * 100).ms);
                },
              )
                  .animate(
                    autoPlay: true,
                  )
                  
                  .shimmer(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 700),
                  )),
    );
  }
}
