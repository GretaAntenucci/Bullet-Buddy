import 'package:bullet_buddy/fab/expandable_fab.dart';
import 'package:bullet_buddy/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        title: const Text('Edit'),
        actions: [
          DropdownButton(
            alignment: Alignment.centerRight,
            underline: const SizedBox(),
            hint: SvgPicture.asset(
              'assets/icons/three_vertical_dots.svg',
              width: 35,
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.transparent,
            ),
            items: const [
              DropdownMenuItem(
                value: 1,
                child: Text('Option 1'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('Option 2'),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text('Option 3'),
              ),
            ],
            onChanged: (value) {},
          )
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          height: double.maxFinite,
          width: double.maxFinite,
          color: const Color(0xFFF0DE94),
          child: const Text('Page 1'),
        ),
      ),
      floatingActionButton: ExpandableFab(
        shape: const CircleBorder(),
        distance: 60,
        children: [
          CustomActionButton(
            icon: Icons.add,
            title: 'Add Page',
            onPressed: () {
              Navigator.pushNamed(context, '/new');
            },
          ),
          CustomActionButton(
            icon: Icons.view_agenda,
            title: 'Templates',
            onPressed: () {
              /// TODO link templates page when it will exist
            },
          ),
        ],
      ),
    );
  }
}
