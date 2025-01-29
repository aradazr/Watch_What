import 'package:flutter/material.dart';

class UpperButton extends StatelessWidget {
  const UpperButton({
    super.key,
    required this.size,
    required this.image,
    required this.onTap,
  });

  final Size size;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(11),
        height: size.height / 21.85,
        width: size.width / 10.05,
        decoration: const BoxDecoration(
          color: Color.fromARGB(100, 137, 137, 137),
          shape: BoxShape.circle,
        ),
        child: Image.asset(image,height: 9,width: 9,),
      ),
    );
  }
}
