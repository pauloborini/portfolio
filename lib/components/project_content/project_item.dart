import 'package:flutter/material.dart';
import 'package:flutter_website/models/project.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatelessWidget {
  final double top;

  const ProjectItem({super.key, required this.top});

  @override
  Widget build(BuildContext context) {
    final project = Provider.of<Project>(context);
    Future<void> launchURL() async {
      var urlProject = project.link;
      if (!await launchUrl(Uri.parse(urlProject))) {
        throw 'Não foi possível abrir o Link';
      }
    }

    return GestureDetector(
      onTap: () {
        launchURL();
      },
      child: Stack(
        children: [
          Positioned(
            top: top,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(1),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(project.image), fit: BoxFit.fitWidth)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor.withOpacity(0.8)),
          ),
          Center(
            child: Text(
              project.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
// Container(
//   alignment: Alignment.center,
//   child: FittedBox(
//     child: Text(
//       project.name,
//       textAlign: TextAlign.center,
//       style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black),
//     ),
//   ),
// )
