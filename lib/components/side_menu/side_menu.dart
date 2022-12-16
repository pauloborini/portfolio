import 'package:flutter/material.dart';
import 'package:flutter_website/components/constants.dart';
import 'package:flutter_website/components/side_menu/my_info.dart';
import 'package:flutter_website/components/side_menu/social_items_png.dart';
import 'package:flutter_website/components/side_menu/social_items_svg.dart';
import 'package:flutter_website/components/side_menu/tech_items.dart';
import 'package:flutter_website/generated/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  Future<void> launchURL() async {
    if (!await launchUrl(Uri.parse(linkCV))) {
      throw 'Não foi possível abrir o Link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(children: [
                  const Text(
                    "Olá! Me chamo Paulo, sou de Itajaí, SC.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: defaultPadding),
                  const Text(
                    'Sou desenvolvedor Mobile a procura de novos desafios. Meu objetivo é encontrar uma vaga de emprego, '
                    'que eu possa me desenvolver e aprender cada vez mais, para isso sou focado e estou em busca '
                    'de novos conhecimentos.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: defaultPadding),
                  const Text(
                      'Aqui estão algumas tecnologias que estou estudando e aprimorando:',
                      style: TextStyle(fontSize: 18)),
                  const SizedBox(height: defaultPadding),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TechItems(
                            asset: Assets.logosDart,
                            name: '  Dart',
                          ),
                          SizedBox(width: defaultPadding * 4),
                          TechItems(
                            asset: Assets.logosFlutter,
                            name: '  Flutter',
                          )
                        ]),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  FittedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TechItems(
                            asset: Assets.logosFirebase,
                            name: '  Firebase',
                          ),
                          SizedBox(width: defaultPadding * 2),
                          TechItems(
                            asset: Assets.logosPython,
                            name: '  Python',
                          )
                        ]),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  FittedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TechItems(
                            asset: Assets.logosPostgresql,
                            name: '  PostgreSQL',
                          ),
                          SizedBox(width: defaultPadding * 2),
                          TechItems(
                            asset: Assets.logosGit,
                            name: '  Git',
                          ),
                        ]),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TechItems(
                          asset: Assets.logosDjango,
                          name: '  Django   e   Django Rest',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  const Divider(),
                  const SizedBox(height: defaultPadding),
                  const Text('Meus contatos e redes sociais',
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SocialItemsSVG(
                        asset: Assets.logosLinked,
                        linkSocial: 'https://www.linkedin.com/in/pauloborini/',
                      ),
                      SizedBox(width: defaultPadding / 3),
                      SocialItemsSVG(
                        asset: Assets.logosInstagram,
                        linkSocial: 'https://www.instagram.com/pauloborini/',
                      ),
                      SizedBox(width: defaultPadding / 3),
                      SocialItemsSVG(
                        asset: Assets.logosDiscord,
                        linkSocial: 'https://discord.com/me_adiciona=Ower#6752',
                      ),
                      SizedBox(width: defaultPadding / 3),
                      SocialItemsSVG(
                        asset: Assets.logosWhatsapp,
                        linkSocial: 'https://wa.me/5547991551987',
                      ),
                      SizedBox(width: defaultPadding / 3),
                      SocialItemsPNG(
                        asset: Assets.logosEmail,
                        linkSocial: 'mailto:pauloborini@outlook.com',
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  GestureDetector(
                    onTap: () {
                      launchURL();
                    },
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Download CV',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: defaultPadding / 2),
                          Icon(
                            FontAwesomeIcons.download,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
