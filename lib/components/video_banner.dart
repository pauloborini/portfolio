import 'package:flutter/material.dart';
import 'package:flutter_website/components/responsive.dart';
import 'package:video_player/video_player.dart';

class VideoBanner extends StatelessWidget {
  final double? top;
  final VideoPlayerController controller;

  const VideoBanner({super.key, this.top, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: top,
            bottom: 0,
            left: 0,
            right: 0,
            child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller))),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: controller.value.size.width,
              height: controller.value.size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Theme.of(context).backgroundColor.withOpacity(0.1),
                Theme.of(context).backgroundColor.withOpacity(0.2),
                Theme.of(context).backgroundColor,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
        ],
      ),
    );
  }
}
