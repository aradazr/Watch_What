import 'package:flutter/material.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/constans/responsive_text.dart';
import 'package:watch_what/data/project_data.dart';
import 'package:watch_what/data/project_manager.dart';

class LikedSerialContainer extends StatelessWidget {
  const LikedSerialContainer({
    super.key,
    required this.size,
    required this.series,
  });

  final Size size;
  final Series series;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 4.46,
      width: size.width / 1.09,
      decoration: BoxDecoration(
        color: DarkColors.greyButton,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 7,
            children: [
              Text(
                series.name,
                style: TextStyle(
                    color: DarkColors.white,
                    fontSize: 20,
                    fontFamily: 'mont',
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    series.point,
                    style: TextStyle(
                      color: DarkColors.white,
                      fontFamily: 'mont',
                      fontSize: const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 16),
                    ),
                  ),
                  Image.asset('assets/images/star.png', height: 24),
                ],
              ),
              SizedBox(
                width: 200,
                child: Text(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  series.description,
                  style: TextStyle(
                    color: DarkColors.white,
                    fontFamily: 'mont',
                    fontSize: const AdaptiveTextSize()
                        .getadaptiveTextSize(context, 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: size.width / 40,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              series.imagePath,
              width: 127,
              height: 164,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
