// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BttnWidget extends StatelessWidget {
  const BttnWidget({
    super.key,
    required this.size, required this.color, required this.text,
  });

  final Size size;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 15.3,
      width: size.width / 2.2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(34),
      ),
      child: Text(text,style: TextStyle(
        color: Colors.white,
        fontFamily: 'vazirb',
        fontSize: 16
      ),),
    );
  }
}
