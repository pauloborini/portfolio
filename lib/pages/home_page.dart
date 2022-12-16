import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/components/constants.dart';
import 'package:flutter_website/components/project_content/projectsview.dart';
import 'package:flutter_website/components/responsive.dart';
import 'package:flutter_website/components/side_menu/side_menu.dart';
import 'package:flutter_website/components/video_banner.dart';
import 'package:flutter_website/generated/assets.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  double topImage = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(Assets.imagesVideo01);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {
          _controller.setVolume(0);
          _controller.setLooping(true);
          _controller.play();
        }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: darkModeColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ),
      drawer: const SideMenu(),
      body: NotificationListener(
        onNotification: (notif) {
          if (notif is ScrollUpdateNotification) {
            if (notif.scrollDelta == null) return true;
            setState(() {
              topImage -= notif.scrollDelta! / 10;
            });
          }
          return true;
        },
        child: Center(
          child: Container(
            color: Colors.transparent,
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    flex: 2,
                    child: SideMenu(),
                  ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  flex: 7,
                  child: DynMouseScroll(
                    builder: (context, controller, physics) =>
                        SingleChildScrollView(
                      controller: controller,
                      physics: physics,
                      child: Column(
                        children: [
                          VideoBanner(
                              controller: _controller, top: topImage * 3),
                          ProjectsView(top: topImage * 3),
                          const SizedBox(height: defaultPadding)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
