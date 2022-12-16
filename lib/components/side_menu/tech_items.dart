import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TechItems extends StatelessWidget {
  final String asset;
  final String name;

  const TechItems({super.key, required this.asset, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 30, width: 30, child: SvgPicture.asset(asset)),
        Text(
          name,
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
