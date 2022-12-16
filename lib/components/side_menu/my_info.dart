import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/components/constants.dart';
import 'package:flutter_website/generated/assets.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Container(
        color: secondaryColor,
        child: Column(
          children: [
            const Spacer(flex: 2),
            DefaultTextStyle(
              textAlign: TextAlign.left,
              style: const TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: Assets.fontsQuicksandRegular,
                  color: primaryColor),
              child: AnimatedTextKit(
                stopPauseOnTap: true,
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'Paulo Borini',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
            const Text(
              "Flutter Developer",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: Assets.fontsQuicksandRegular,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
