import 'package:flutter/material.dart';
import 'package:flutter_website/components/constants.dart';
import 'package:flutter_website/components/responsive.dart';
import 'package:flutter_website/providers/project_list.dart';
import 'package:provider/provider.dart';

import 'project_item.dart';

class ProjectsView extends StatelessWidget {
  final double top;

  const ProjectsView({
    Key? key,
    required this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding * 1.5),
          const Text("Projetos", style: TextStyle(fontSize: 24)),
          const SizedBox(height: defaultPadding),
          Responsive(
            mobile: ProjectsGridView(
              crossAxisCount: 1,
              childAspectRatio: 1.7,
              top: top,
            ),
            mobileLarge: ProjectsGridView(
              crossAxisCount: 2,
              top: top,
            ),
            tablet: ProjectsGridView(
              childAspectRatio: 1.1,
              top: top,
            ),
            desktop: ProjectsGridView(
              top: top,
            ),
          )
        ],
      ),
    );
  }
}

class ProjectsGridView extends StatelessWidget {
  final double top;

  const ProjectsGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
    required this.top,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final ProjectList projectList = Provider.of(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projectList.itemCount(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: projectList.listProject[index],
        child: ProjectItem(top: top),
      ),
    );
  }
}
