import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialItemsPNG extends StatelessWidget {
  final String asset;
  final String linkSocial;

  const SocialItemsPNG(
      {super.key, required this.asset, required this.linkSocial});

  Future<void> launchURL() async {
    var urlSocial = linkSocial;
    if (!await launchUrl(Uri.parse(urlSocial))) {
      throw 'Não foi possível abrir o Link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          launchURL();
        },
        child: SizedBox(height: 30, width: 30, child: Image.asset(asset)));
  }
}
