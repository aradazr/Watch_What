import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/constans/favorite_series_provider.dart';
import 'package:watch_what/widgets/liked_serial_container.dart';

class WatchedScreen extends StatelessWidget {
  const WatchedScreen({super.key});

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
                style: TextStyle(color: Colors.white),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: likedSeries.length,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: LikedSerialContainer(
                      size: size,
                      series: likedSeries[index], // پاس دادن سریال‌های لایک‌شده
                    ),
                  );
                },
              ),
            ),
    );
  }
}
