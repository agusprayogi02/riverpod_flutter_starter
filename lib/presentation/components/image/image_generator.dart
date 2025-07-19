import 'package:flutter/material.dart';
import 'package:starter/presentation/themes/theme.dart';

class ImageGenerator extends StatelessWidget {
  const ImageGenerator({super.key, this.size, required this.name});

  final double? size;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 100,
      height: size ?? 100,
      decoration: BoxDecoration(
        color: ColorTheme.grey,
        borderRadius: BorderRadius.circular(size ?? 100),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: (size ?? 100) - ((size ?? 100) * .25),
      ),
      // child: Center(
      //   child: Text(
      //     name.substring(0, 1).toUpperCase(),
      //     style: TextStyle(
      //       fontSize: (size ?? 100) / 2,
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}
