// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/constans/responsive_text.dart';

class BttnWidget extends StatelessWidget {
  const BttnWidget({
    super.key,
    required this.size, required this.color, required this.text, required this.onTap,
  });

  final Size size;
  final Color color;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height / 15.3,
        width: size.width / 2.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(34),
        ),
        child: Text(text,style: TextStyle(
          color: DarkColors.white,
          fontFamily: 'vazirb',
          fontSize: const AdaptiveTextSize()
                                .getadaptiveTextSize(context, 13),
        ),),
      ),
    );
  }
}
